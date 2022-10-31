class User < ApplicationRecord
  has_secure_password

  has_many :sender_users
  has_many :user_credits

  enum status: { inactive: 0, active: 1}, _default: :inactive

  validates :cellphone, presence: { message: 'CELLPHONE_IS_REQUIRED' }
  validates :cellphone, uniqueness: { message: 'CELLPHONE_IS_NOT_AVAILABLE' }
  validates :name, presence: { message: 'NAME_IS_REQUIRED' }

  def create_otp
    self.otp = SecureRandom.random_number(10**6).to_s.rjust(6, '0')
    self.save
  end
end
