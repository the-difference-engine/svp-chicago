class ReorderRfpRatings1 < ActiveRecord::Migration
  def change
    change_column :rfp_ratings, :q7, :integer, after: :q6
  end
end
