class RenameCustomerColumnToUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :subscriptions, :customer_id, :user_id
  end
end
