class Manager < ApplicationRecord
  #acts_as_token_authenticatable
  #devise :database_authenticatable, :recoverable, :rememberable, :validatable

  enum status: { inactive: 0, active: 1}, _default: :inactive
end
