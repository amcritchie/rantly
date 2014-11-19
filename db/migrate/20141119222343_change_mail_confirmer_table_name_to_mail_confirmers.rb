class ChangeMailConfirmerTableNameToMailConfirmers < ActiveRecord::Migration
  def change
    rename_table :mail_confirmer, :mail_confirmers
  end
end
