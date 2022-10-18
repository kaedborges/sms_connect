class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.string :email
      t.string :encrypted_password
      t.string :cellphone
      t.string :nome

      t.timestamps
    end
  end
end
