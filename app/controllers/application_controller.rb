class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    private
    SECRET_KEY = 'secrete2022Teste'

    def encode_token(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end

    def decode_token(token)
        decoded = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new decoded
    end

    def validate_manager_token
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = decode_token(header)
            @current_manager = Manager.find_by(id: @decoded['manager_id'])
        rescue ActiveRecord::RecordNotFound => e
            render :unauthorized, status: :unauthorized
        rescue JWT::DecodeError => e
            render :unauthorized, status: :unauthorized
        end
    end
    def validate_user_token
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = decode_token(header)
            @current_user = User.find_by(id: @decoded['user_id'])
        rescue ActiveRecord::RecordNotFound => e
            render :unauthorized, status: :unauthorized
        rescue JWT::DecodeError => e
            render :unauthorized, status: :unauthorized
        end
    end

    def random_password(length = 12)
        chars = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
        @password = chars.sort_by { rand }.join[0...length]
        @password
    end

    def not_found
        render :not_found, status: :not_found
    end
end
