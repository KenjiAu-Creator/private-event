class ChangeTimeForEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :string
    add_column :events, :date, :string
  end
end
