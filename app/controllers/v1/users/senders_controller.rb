module V1
  module Users
    class SendersController < ApplicationController
      before_action :validate_user_token

      def index
        render :index, status: :ok
      end

      def new
        sender = SenderRequest.find_by(name: params[:sender])
        render :sender_exist, status: :bad_request and return unless sender.nil?

        sender_ = Sender.find_by('LOWER(name)= ?', params[:sender].to_s.downcase)
        render :sender_exist, status: :bad_request and return unless sender_.nil?

        @requested = SenderRequest.create(user_id: @current_user.id, name: params[:sender], status: 0,
                                          reason: params[:reason])
        render :sender_requested, status: :created
      end

    end
  end
end
