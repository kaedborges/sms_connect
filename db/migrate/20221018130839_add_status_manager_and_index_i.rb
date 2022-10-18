class AddStatusManagerAndIndexI < ActiveRecord::Migration[7.0]
  def change
    add_column :managers, :authentication_token, :integer
  end
end
