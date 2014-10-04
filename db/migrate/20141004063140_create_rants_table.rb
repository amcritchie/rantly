class CreateRantsTable < ActiveRecord::Migration
  def change
    create_table :rants_table do |t|
      t.integer :user_id
      t.string :title
      t.text :rant

      t.timestamps
    end
  end
end
