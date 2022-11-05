class ChangeTypeStatusColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :recipients, :status, :string
  end
end
