class AddRantColumn < ActiveRecord::Migration
  def change
    add_column :rants, :spam, :boolean
  end
end
