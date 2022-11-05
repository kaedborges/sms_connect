class SendMessageJob < ApplicationJob
  queue_as :default

  # @param [string] cellphone
  # @param [string] message
  # @param [string] sender
  # @param [integer] message_id
  def perform(cellphone, message, sender, message_id)
    result = SendSmsBackboneServices.new.send_sms(cellphone, message, sender)
    gateway_id = JSON.parse(result)['id']

    object = JSON.parse(SendSmsBackboneServices.new.details_sms(gateway_id))['recipients']
    object.map do |s|
      r = Recipient.new
      r.phone = s['phone']
      r.status = s['status']
      r.message_id = message_id
      r.save
    end
    Message.update(id: message_id, gataway_id: gateway_id)
  end
end
