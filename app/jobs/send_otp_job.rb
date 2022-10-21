class SendOtpJob < ApplicationJob
  queue_as :default

  def perform(user)
    message = "Your OTP is #{user.otp}"
    SendSmsBackboneServices.new.send_sms(user.cellphone, message, "KAEDCODE")
  end
end
