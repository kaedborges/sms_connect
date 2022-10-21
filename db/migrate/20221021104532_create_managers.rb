class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.string :email
      t.string :name
      t.integer :status
      t.string :token_auth
      t.string :cellphone
      t.string :password_digest

      t.timestamps
    end
  end
end
