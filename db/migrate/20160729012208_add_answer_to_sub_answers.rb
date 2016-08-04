class AddAnswerToSubAnswers < ActiveRecord::Migration
  def change
    add_column :sub_answers, :answer, :string
  end
end
