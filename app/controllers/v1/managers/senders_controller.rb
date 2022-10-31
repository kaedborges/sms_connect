module V1
  module Managers
    class SendersController < ApplicationController
      before_action :validate_manager_token

      def all_sender
        @senders = Sender.all
      end
      def show
        @sender = Sender.find_by(user_id: @user.id)
        render :not_found, status: :not_found and return if @sender.nil?

        render :show, status: :ok
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


    end
  end
end
