class AddTotalScore < ActiveRecord::Migration
  def change
    add_column :rfp_ratings, :total_score, :integer
  end
end
