class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :loi_id
      t.string :rating_fields

      t.timestamps null: false
    end
  end
end
