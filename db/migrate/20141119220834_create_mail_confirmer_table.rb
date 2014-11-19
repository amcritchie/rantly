class CreateMailConfirmerTable < ActiveRecord::Migration
  def change
    create_table :mail_confirmer do |t|
      t.string :uuid
      t.string :email
    end
  end
end
