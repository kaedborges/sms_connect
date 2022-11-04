class Message < ApplicationRecord
  belongs_to :user
  belongs_to :sender

  has_many :recipients
end
