class CreateFtes < ActiveRecord::Migration
  def change
    create_table :ftes do |t|
      t.integer :answer_id
      t.integer :amount_1
      t.integer :amount_2
      t.integer :amount_3

      t.timestamps null: false
    end
  end
end
