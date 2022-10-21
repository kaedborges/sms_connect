module V1
  module Managers
    class UsersController < ApplicationController
      before_action :random_password, only: :new
      before_action :validate_manager_token
      before_action :set_user, only: %i[destroy new reset_user_password unlock lock show]

      def index
        @users = User.all#.where({status: 1})
        render :list_users, status: :ok
      end

      def new
        @user = User.new(user_params)
        @user.password = @password
        @user.password_confirmation = @password

        render :bad_request, status: :bad_request and return unless @user.active!

        SendNotificationSmsJob.perform_later(@user, @password)
        render :new_user, status: :created
      end

      def reset_user_password
        render :user_service_unavailable, status: :bad_request and return if @user.nil?
        @user.password = @password
        @user.password_confirmation = @password

        render :bad_request, status: :bad_request and return unless @user.update
        SendNotificationSmsJob.perform_later(@user, @password)
        head :no_content
      end

      def lock
        head :accepted and return if @user.inactive?
        @user.inactive!
        head :accepted
      end


      def unlock
        head :accepted and return if @user.active?
        @user.active!
        head :accepted
      end

      def show
        render :list_user, status: :ok
      end

      def destroy
        if @user.nil?
          render :not_found, status: :not_found
        else
          @user.destroy
          head :no_content
        end
      end

      private

      def user_params
        params.permit(:name, :email, :cellphone)
      end
      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
