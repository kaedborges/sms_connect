class AddStatusManagerAndIndex < ActiveRecord::Migration[7.0]
  def change
    add_column :managers, :status, :integer
    add_index :managers, :authentication_token, unique: true
  end
end
