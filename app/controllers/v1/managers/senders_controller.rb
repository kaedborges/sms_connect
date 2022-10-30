module V1
  module Managers
    class SendersController < ApplicationController
      before_action :validate_manager_token
      before_action :set_user, only: %i[new_user]

      def all_sender
        @senders = Sender.all
        pp @senders
      end

      def new_user
        @sender = Sender.find(id: params[sender_id])
        render :not_found, status: :not_found and return if @sender.nil?
        render :not_found, status: :not_found and return if SenderUser.find_by(sender_id: @sender.id).nil?

        @userSender = SenderUser.create(user_id: @user.id, sender_id: @sender.id, status: 1)
        render :new_user_sender, status: :ok
      end

      def update
        senders = JSON.parse(SendSmsBackboneServices.new.sender)['content']
        list_sender = senders.map { |s|
          sender = Sender.find_by(name: s['sender'])
          if sender.nil?
            Sender.create(name: s['sender'], status: 0, pattern: false )
          end
        }
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
