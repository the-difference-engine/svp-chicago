class DashboardDefaultAttrbFalse < ActiveRecord::Migration
  def change
    change_column :dashboards, :deadline_open?, :boolean, :default => false
  end
end
