class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    # User.reset_column_information
    User.all.each do |u|
      u.admin = false
      u.save
    end
  end
end
