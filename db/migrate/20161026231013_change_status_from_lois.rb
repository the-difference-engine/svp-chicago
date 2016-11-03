class ChangeStatusFromLois < ActiveRecord::Migration
  def change
    rename_column :lois, :status, :reject
  end
end
