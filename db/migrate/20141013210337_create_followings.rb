class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :user_following_id
      t.integer :user_being_followed_id

      t.timestamps
    end
  end
end
