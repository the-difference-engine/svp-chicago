class CreateRfpRatings < ActiveRecord::Migration
  def change
    create_table :rfp_ratings do |t|
      t.integer :question1
      t.integer :question2
      t.integer :question3
      t.integer :question4
      t.integer :question5
      t.integer :question6
      t.boolean :invite?
      t.text :comments

      t.timestamps null: false
    end
  end
end
