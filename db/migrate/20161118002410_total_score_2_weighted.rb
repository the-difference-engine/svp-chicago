class TotalScore2Weighted < ActiveRecord::Migration
  def change
    rename_column :rfp_ratings, :total_score, :weighted_score
  end
end
