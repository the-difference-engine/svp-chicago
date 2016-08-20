class AddIsActiveToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :is_active, :boolean, default: true
  end
end
