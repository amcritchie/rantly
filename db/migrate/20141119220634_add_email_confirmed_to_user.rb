class AddEmailConfirmedToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_confirmed, :boolean
  end
end
