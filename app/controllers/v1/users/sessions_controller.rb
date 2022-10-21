module V1
  module Users
    class SessionsController < ApplicationController

      def new
        @user = User.find_by(cellphone: params[:cellphone])
        render :invalid_credentials, status: :unauthorized and return if @user.nil?
        puts @user.email
        puts @user.authenticate(params[:password])
        render :invalid_credentials, status: :unauthorized and return unless @user.authenticate(params[:password])

        @token = encode_token(
          {
              user_id: @user.id,
              email: @user.email,
              status: @user.status
          })
        @time = Time.now + 24.hours.to_i
        render :token_session, status: :ok

      end

    end
  end
end
