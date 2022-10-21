class CreateUserrs < ActiveRecord::Migration[7.0]
  def change
    create_table :userrs do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :cellphone
      t.integer :status
      t.integer :otp

      t.timestamps
    end
  end
end
