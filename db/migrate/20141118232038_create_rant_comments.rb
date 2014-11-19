class CreateRantComments < ActiveRecord::Migration
  def change
    create_table :rant_comments do |t|
      t.text :comment
      t.integer :rant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
