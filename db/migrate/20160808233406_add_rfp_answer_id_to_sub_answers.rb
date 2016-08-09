class AddRfpAnswerIdToSubAnswers < ActiveRecord::Migration
  def change
    add_column :sub_answers, :rfp_answer_id, :integer
  end
end
