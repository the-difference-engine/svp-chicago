class Type < ActiveRecord::Migration
  def change
    rename_column :dashboards, :dashboard_open?, :deadline_open?
  end
end
