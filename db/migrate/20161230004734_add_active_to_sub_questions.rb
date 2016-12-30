class AddActiveToSubQuestions < ActiveRecord::Migration
  def change
  	add_column :sub_questions, :is_active, :boolean, default: true
  end
end
