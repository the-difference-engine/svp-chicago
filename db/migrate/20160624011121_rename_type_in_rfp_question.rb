class RenameTypeInRfpQuestion < ActiveRecord::Migration
  def change
    rename_column :rfp_questions, :type, :question_type
  end
end
