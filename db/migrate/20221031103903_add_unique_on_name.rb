class AddUniqueOnName < ActiveRecord::Migration[7.0]
  def change
    add_index :sender_requests, :name, unique: true
  end
end
