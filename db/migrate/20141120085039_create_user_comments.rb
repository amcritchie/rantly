class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :commenter_id
    end
  end
end
