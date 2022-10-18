class SendSmsBackboneServices
    include HTTParty
    base_uri '52.30.114.86:8080/mimosms/v1/message'

    def initialize

    end

    def send_sms(number,text,sender)
        payload = {
            :sender => sender,
            :recipients => number,
            :text => text
        }
        self.class.post("/send?token=", payload)
    end
end
