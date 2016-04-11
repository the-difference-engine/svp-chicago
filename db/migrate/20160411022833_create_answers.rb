class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :loi_id
      t.string :answer

      t.timestamps null: false
    end
  end
end
