class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: true
      t.text :text
      t.integer :size
      t.integer :parts
      t.boolean :flag

      t.timestamps
    end
  end
end
