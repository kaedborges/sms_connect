module V1
  module Managers
    class SenderUsersController < ApplicationController
      before_action :validate_manager_token
      before_action :set_user, only: %i[new show set_sender_inprogress]

      def show
        render :not_found, status: :not_found and return if @user.nil?

        render :show_user, status: :ok
      end

      def new
        @sender = Sender.find_by(id: params[:sender_id])
        render :not_found, status: :not_found and return if @sender.nil?
        render :not_found, status: :not_found and return if SenderUser.find_by(sender_id: @sender.id)

        @userSender = SenderUser.create(user_id: @user.id, sender_id: @sender.id, status: 1)
        render :new_user_sender, status: :ok
      end

      def destroy
        @sender = Sender.find(params[:id])
        render :not_found, status: :not_found and return if @sender.nil?

        @user = User.find(params[:user_id])
        render :not_found, status: :not_found and return if @sender.nil?

        @userSender = SenderUser.find_by({user_id: @user.id, sender_id: @sender.id})
        pp @userSender
        SenderUser.delete(@userSender)
        head :no_content
      end

      def set_sender_inprogress
        @senderRequested = SenderRequest.find_by('LOWER(name)= ? and user_id = ?', params[:sender].to_s.downcase, @user.id)
        head :accepted and return if @senderRequested.progress?

        head :accepted and return @senderRequested.progress!
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
