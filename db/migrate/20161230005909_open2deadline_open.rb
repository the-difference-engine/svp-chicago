class Open2deadlineOpen < ActiveRecord::Migration
  def change
    rename_column :dashboards, :open?, :dashboard_open?
  end
end
