class SendNotificationSmsJob < ApplicationJob
  queue_as :default

  def perform(manager, password)
    message = "Hi #{manager.nome}, Your Account was created, password is #{password}"
    SendSmsBackboneServices.new.send_sms(manager.cellphone, message, "KAEDCODE")
  end
end
