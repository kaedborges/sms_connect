class CreateSenderUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :sender_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
