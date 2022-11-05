module V1
  module Users
    class MessagesController < ApplicationController
      before_action :validate_user_token

      def index
        @messages = Message.where(user_id: @current_user.id)
      end

      def new

        render :error_empity_text, status: :bad_request and return if params[:text].to_s.blank?
        render :error_empity_sender, status: :bad_request and return if params[:sender].to_s.blank?
        render :error_empity_recipients, status: :bad_request and return if params[:recipients].to_s.blank?

        @sender = Sender.find_by('LOWER(name)= ?', params[:sender].to_s.downcase)
        render :not_found_sender, status: :bad_request and return if @sender.nil?

        senderUSer = SenderUser.find_by(sender_id: @sender.id)

        render :not_found_sender, status: :bad_request and return if senderUSer.sender_id == @current_user.id

        smsCounte = DueSmsCounter.calc_char_and_sms_count(params[:text])

        credits = UserCredit.find_by(user_id: @current_user.id)
        gateway_credits = JSON.parse(SendSmsBackboneServices.new.credit)['balance']

        recipients = params[:recipients].to_s.split(/,/)

        total_sms = recipients.size * smsCounte[:sms_count]

        render :insuficient_credit, status: :bad_request and return if total_sms > credits.balace
        render :insuficient_credit, status: :bad_request and return if total_sms > gateway_credits.to_i

        @message = Message.new
        @message.sender = @sender
        @message.user = @current_user
        @message.text = params[:text]
        @message.parts = smsCounte[:sms_count]
        @message.size = smsCounte[:char_count]
        @message.save

        SendMessageJob.perform_later(recipients.join(','), @message.text, @sender.name, @message.id)

        balance = credits.balace - total_sms

        UserCredit.update(credits.id, balace: balance)

        render :send_message, status: :ok
      end

      def show
        @message = Message.find_by(user_id: @current_user.id, id: params[:id])
      end

      def show_recipients
        @message = Message.find_by(user_id: @current_user.id, id: params[:id])
      end

      def message_params
        params.permit(:text, :recipient, :sender)
      end
    end
  end
end
