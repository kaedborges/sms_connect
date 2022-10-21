module V1
  module Managers
    class SessionsController < ApplicationController

      def new
        @manager = Manager.find_by(email: params[:email])
        render :invalid_credentials, status: :unauthorized and return if @manager.nil?
        puts @manager.email
        puts @manager.authenticate(params[:password])
        render :invalid_credentials, status: :unauthorized and return unless @manager.authenticate(params[:password])

        @token = encode_token(
          {
              manager_id: @manager.id,
              email: @manager.email,
              status: @manager.status
          })
        @time = Time.now + 24.hours.to_i
        render :token_session, status: :ok

      end

    end
  end
end
