class AddColumnReason < ActiveRecord::Migration[7.0]
  def change
    add_column :sender_requests, :reason, :string
  end
end
