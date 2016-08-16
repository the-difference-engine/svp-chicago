class CreateRfpAnswers < ActiveRecord::Migration
  def change
    create_table :rfp_answers do |t|
      t.integer :rfp_question_id
      t.integer :rfp_id
      t.string :answer

      t.timestamps null: false
    end
  end
end