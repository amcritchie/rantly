class CreateSpamTable < ActiveRecord::Migration
  def change
    create_table :spams do |t|
      t.integer :rant_id
      t.boolean :resolved
    end
  end
end
