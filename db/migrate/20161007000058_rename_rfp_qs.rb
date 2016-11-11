class RenameRfpQs < ActiveRecord::Migration
  def change
    rename_column :rfp_ratings, :question1, :q1
    rename_column :rfp_ratings, :question2, :q2
    rename_column :rfp_ratings, :question3, :q3
    rename_column :rfp_ratings, :question4, :q4
    rename_column :rfp_ratings, :question5, :q5
    rename_column :rfp_ratings, :question6, :q6
  end
end
