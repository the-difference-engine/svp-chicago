class CreateRfpSections < ActiveRecord::Migration
  def change
    create_table :rfp_sections do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
