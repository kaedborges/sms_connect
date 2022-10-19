class SendSmsBackboneServices
    include HTTParty
    base_uri '52.30.114.86:8080/mimosms/v1/message'

    attr_accessor :payload
    def initialize
        @payload
    end
    def send_sms(number,text,sender)
        payload = {
            :sender => sender,
            :recipients => number,
            :text => text
        }
        self.class.post("/send?token=2ae7b2e6b39ea7e9689784dff8789488927878988", payload)
    end
end
