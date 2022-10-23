class AddPatternInSender < ActiveRecord::Migration[7.0]
  def change
    add_column :senders, :pattern, :boolean
  end
end
