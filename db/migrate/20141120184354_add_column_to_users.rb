class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :disabled, :boolean
  end
end
