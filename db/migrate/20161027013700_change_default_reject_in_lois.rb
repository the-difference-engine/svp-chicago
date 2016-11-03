class ChangeDefaultRejectInLois < ActiveRecord::Migration
  def change
    change_column :lois, :reject, :boolean, default: true
  end
end
