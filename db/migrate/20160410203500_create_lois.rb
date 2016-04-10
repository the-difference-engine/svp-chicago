class CreateLois < ActiveRecord::Migration
  def change
    create_table :lois do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
