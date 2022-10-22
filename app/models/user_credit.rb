class UserCredit < ApplicationRecord
  belongs_to :user


  # enum operation: { transfer: 'TRANSFER', add: 'ADD'}, _default: transfer
end
