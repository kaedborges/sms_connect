class User < ApplicationRecord
  has_secure_password

  enum status: { inactive: 0, active: 1}, _default: :inactive
  validates :cellphone, presence: { message: 'CELLPHONE_IS_REQUIRED' }
  validates :cellphone, uniqueness: { message: 'CELLPHONE_IS_NOT_AVAILABLE' }
  validates :cellphone, phone: {types: [:mobile], countries: :ao, message: 'INVALID_PHONE_NUMBER'}
  validates :name, presence: { message: 'NAME_IS_REQUIRED' }

  def create_otp
    self.otp = SecureRandom.random_number(10**6).to_s.rjust(6, '0')
    self.save
  end
end
