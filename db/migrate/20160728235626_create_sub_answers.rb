class CreateSubAnswers < ActiveRecord::Migration
  def change
    create_table :sub_answers do |t|
      t.integer :sub_question_id
      t.integer :user_id
      t.integer :rfp_id

      t.timestamps null: false
    end
  end
end
