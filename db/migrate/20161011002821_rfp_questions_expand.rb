class RfpQuestionsExpand < ActiveRecord::Migration
  def change
    change_column :rfp_ratings, :q5, :integer
    add_column :rfp_ratings, :q7, :integer
    add_column :rfp_ratings, :q8, :boolean
    add_column :rfp_ratings, :q9, :integer
    add_column :rfp_ratings, :q10, :boolean
    add_column :rfp_ratings, :q11, :integer
    add_column :rfp_ratings, :q12, :boolean
    add_column :rfp_ratings, :q13, :text
  end
end
