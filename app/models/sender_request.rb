class SenderRequest < ApplicationRecord
  belongs_to :user

  enum status: { pending: 0, progress: 1, rejected: 2, approved: 3}, _default: :pending
end
