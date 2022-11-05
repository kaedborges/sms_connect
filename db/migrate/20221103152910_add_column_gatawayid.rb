class AddColumnGatawayid < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :gataway_id, :integer
    add_index :messages, :gataway_id
  end
end
