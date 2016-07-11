class CreateSubQuestions < ActiveRecord::Migration
  def change
    create_table :sub_questions do |t|
      t.integer :rfp_question_id
      t.string :question

      t.timestamps null: false
    end
  end
end
