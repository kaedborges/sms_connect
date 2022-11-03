module V1
  module Managers
    class SendersController < ApplicationController
      before_action :validate_manager_token
      before_action :set_sender, only: :show

      def index
        @senders = Sender.all
      end

      def sender_requested
        @senderRequested = SenderRequest.where(status: 0)
      end

      def request_Sender
        SendSmsBackboneServices.new.add_sender(params[:sender], params[:reason])
        head :accepted
      end

      def show
        render :not_found, status: :not_found and return if @sender.nil?

        render :show, status: :ok
      end

      def update
        senders = JSON.parse(SendSmsBackboneServices.new.sender)['content']
        senders.map do |s|
          sender = Sender.find_by(name: s['sender'])
          Sender.create(name: s['sender'], status: 0, pattern: false) if sender.nil?
          @senderR = SenderRequest.find_by('LOWER(name)= ?', s['sender'].to_s.downcase)
          unless @senderR.nil?
            @senderR.approved!
            SenderUser.create(user_id: @senderR.user.id, sender_id: sender.id, status: 1)
          end
        end
      end

      private

      def set_sender
        @sender = Sender.find(params[:id])
      end

    end
  end
end
