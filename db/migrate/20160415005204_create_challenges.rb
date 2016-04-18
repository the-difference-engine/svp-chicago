class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :answer_id
      t.string :challenge
      t.string :priority

      t.timestamps null: false
    end
  end
end
