class AddDefaultToUsersActiveAccount < ActiveRecord::Migration
  def change
    change_column :users, :active_account, :boolean, default: true
  end
end


