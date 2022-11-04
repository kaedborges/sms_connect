class CreateRecipients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipients do |t|
      t.references :message, null: false, foreign_key: true
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end
