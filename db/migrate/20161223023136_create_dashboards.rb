class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.boolean :open?

      t.timestamps null: false
    end
  end
end
