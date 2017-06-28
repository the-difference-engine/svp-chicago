class AddDateToDashboard < ActiveRecord::Migration
  def change
    add_column :dashboards, :loi_closing_date, :datetime, :default => Time.now
  end
end
