class Manager < ApplicationRecord
  has_secure_password

  enum status: { inactive: 0, active: 1}, _default: :inactive
end
