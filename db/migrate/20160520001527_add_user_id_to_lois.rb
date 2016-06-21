class AddUserIdToLois < ActiveRecord::Migration
  def change
    add_column :lois, :user_id, :integer
  end
end
