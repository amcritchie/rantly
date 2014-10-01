class AddRantFrequencyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rant_frequency, :string
  end
end
