class AddUserIdToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :user_id, :integer
    add_column :users, :account_id, :integer
  end
end
