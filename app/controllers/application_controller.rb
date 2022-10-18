class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    private 

    def validate_manager_token
        token = request.header['Authorization']
        API_KEY = request.header['API_KEY']
        rende :unauthorized, status: :unauthorized and return if API_KEY.nil? || API_KEY != "KD sms_connect"
        rende :unauthorized, status: :unauthorized and return if token.nil?

        @manager = Manager.find_by(authentication_token: token)
        render :unauthorized, status: :unauthorized and return if @manager.nil?

        @manager
    end
end
