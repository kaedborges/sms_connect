class CreateCreditsHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :credits_histories do |t|
      t.integer :balance
      t.string :operation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
