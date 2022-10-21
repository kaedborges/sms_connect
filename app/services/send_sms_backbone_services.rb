class SendSmsBackboneServices
    require 'rest-client'

    attr_accessor :base_uri

    def initialize
        @base_uri = '52.30.114.86:8080/mimosms/v1/message'
        @token_mimo = '2ae7b2e6b39ea7e9689784dff8789488927878988'
    end

    def send_sms(number,text,sender)
        payload = {
            :sender => sender,
            :recipients => number,
            :text => text
        }
        RestClient.post("#{@base_uri}/send?token=#{@token_mimo}", payload.to_json, { content_type: :json, accept: :json })
    end
end
