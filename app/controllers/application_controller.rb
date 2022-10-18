class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    private 

    def validate_manager_token
        token = request.header['Authorization']
        api_key = request.header['API_KEY']
        rende :unauthorized, status: :unauthorized and return if api_key.nil? || api_key != "KD sms_connect"
        rende :unauthorized, status: :unauthorized and return if token.nil?

        @manager = Manager.find_by(authentication_token: token)
        render :unauthorized, status: :unauthorized and return if @manager.nil?

        @manager
    end

    def random_password(length = 12)
        chars = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
        @password = chars.sort_by { rand }.join[0...length]
        @password
      end
end
