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

      def show
        render :not_found, status: :not_found and return if @sender.nil?

        render :show, status: :ok
      end

      def update
        senders = JSON.parse(SendSmsBackboneServices.new.sender)['content']
        senders.map do |s|
          sender = Sender.find_by(name: s['sender'])
          Sender.create(name: s['sender'], status: 0, pattern: false) if sender.nil?
        end
      end

      private

      def set_sender
        @sender = Sender.find(params[:id])
      end

    end
  end
end
