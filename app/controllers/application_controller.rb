class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    private
    SECRET_KEY = 'secrete2022Teste'
    def encode_token(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end

    def decode_token
        auth_header = request.headers['Authorization']
        render :unauthorized, status: :unauthorized and return if auth_header.nil?

        if auth_header
            token = auth_header.split(' ').last
            puts token
            begin
                JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def validate_manager_token
        token = decode_token
        puts token
        if token
            manager_id = token[0]['user_id']
            @current_manager = Manager.find_by(id: manager_id)
        else
            render :unauthorized, status: :unauthorized
        end
    end

    # def validate_manager_token
    #     token = request.header['Authorization']
    #     api_key = request.header['API_KEY']
    #     rende :unauthorized, status: :unauthorized and return if api_key.nil? || api_key != "KD sms_connect"
    #     rende :unauthorized, status: :unauthorized and return if token.nil?
    #
    #     @manager = Manager.find_by(authentication_token: token)
    #     render :unauthorized, status: :unauthorized and return if @manager.nil?
    #
    #     @manager
    # end

    def random_password(length = 12)
        chars = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
        @password = chars.sort_by { rand }.join[0...length]
        @password
      end
end
