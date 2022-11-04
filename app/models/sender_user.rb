class SenderUser < ApplicationRecord
  belongs_to :user
  belongs_to :sender
end
