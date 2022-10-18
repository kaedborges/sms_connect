class AddStatusManager < ActiveRecord::Migration[7.0]
  def change
    add_column :managers, :status, :integer
    add_index :merchant_accounts, :authentication_token, unique: true
  end
end
