class AddCellphoneAndNameAndStatusInManager < ActiveRecord::Migration[7.0]
  def change
    add_column :managers, :name, :string
    add_column :managers, :cellphone, :string
    add_column :managers, :status, :integer

    add_index :managers, :cellphone
    add_index :managers, :status
  end
end
