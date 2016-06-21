class CreateLandings < ActiveRecord::Migration
  def change
    create_table :landings do |t|
      t.string :year
      t.string :sector_focus
      t.text :main_points
      t.text :gray_section
      t.text :last_point

      t.timestamps null: false
    end
  end
end
