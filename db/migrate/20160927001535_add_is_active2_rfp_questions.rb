class AddIsActive2RfpQuestions < ActiveRecord::Migration
  def change
    add_column :rfp_questions, :is_active, :boolean, default: true
  end
end
