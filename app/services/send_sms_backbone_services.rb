class SendSmsBackboneServices
  require 'rest-client'

  attr_accessor :base_uri

  def initialize
    @base_uri = '52.30.114.86:8080/mimosms/v1/'
    @token_mimo = '2ae7b2e6b39ea7e9689784dff8789488927878988'
  end

  def send_sms(number,text,sender)
    payload = {
      :sender => sender,
      :recipients => number,
      :text => text
    }
    RestClient.post("#{@base_uri}message/send?token=#{@token_mimo}", payload.to_json, { content_type: :json, accept: :json })
  end

  def credit
    response = RestClient.get("#{@base_uri}credit?token=#{@token_mimo}")
    return response.body
  end

  def sender
    get_responde('sender-id/list-all').body
  end

  private

  def get_responde(url)
    RestClient.get("#{@base_uri}#{url}?token=#{@token_mimo}")
  end
end
