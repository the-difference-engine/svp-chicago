class CreateDashboads < ActiveRecord::Migration
  def change
    create_table :dashboads do |t|
      t.boolean :open?

      t.timestamps null: false
    end
  end
end
