module V1
  module Users
    class RegistrationsController < ApplicationController

      def new
        @user = User.find_by(cellphone: params[:cellphone])
        if !@user.nil? && @user.inactive?
          @user.create_otp
          SendOtpJob.perform_later(@user)
          head :accepted, location: '/users/registrations/confirmation' and return
        end

        @user = User.new(user_params)
        render :bad_request, status: :bad_request and return unless @user.save

        @user.create_otp
        SendOtpJob.perform_later(@user)
        head :accepted, location: '/users/registrations/confirmation'

      end

      def confirmation
        @user = User.find_by(cellphone: params[:cellphone])
        render :invalid_number_or_password, status: :bad_request and return if @user.nil?

        render :bad_request, status: :bad_request and return if @user.active?

        render :bad_request, status: :bad_request and return unless @user.cellphone == params[:cellphone]

        render :bad_request, status: :bad_request and return unless @user.otp == params[:otp]

        render :bad_request, status: :bad_request and return unless @user.active!

        render 'v1/users/sessions/session', status: :created
      end

      private

      def user_params
        params.permit(:name, :cellphone, :password, :password_confirmation, :otp)
      end

    end
  end
end
