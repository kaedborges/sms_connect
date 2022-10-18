class SendNotificationSmsJob < ApplicationJob
  queue_as :default

  def perform(manager, password)
    @message = "Teste"
    SendSmsBackboneServices.new.send_sms(manager.cellphone, @message, "Kaedcode")
  end
end
