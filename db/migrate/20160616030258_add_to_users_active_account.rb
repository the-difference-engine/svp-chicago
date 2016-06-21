class AddToUsersActiveAccount < ActiveRecord::Migration
  def change
        add_column :users, :active_account, :boolean
  end
end
