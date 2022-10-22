class CreateUserCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :user_credits do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :balace
      t.string :operation

      t.timestamps
    end
  end
end
