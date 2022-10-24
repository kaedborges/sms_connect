class CreateSenders < ActiveRecord::Migration[7.0]
  def change
    create_table :senders do |t|
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
