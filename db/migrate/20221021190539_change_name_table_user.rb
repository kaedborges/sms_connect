class ChangeNameTableUser < ActiveRecord::Migration[7.0]
  def change
    rename_table :userrs, :users
  end
end
