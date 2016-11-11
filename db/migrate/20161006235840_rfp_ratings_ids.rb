class RfpRatingsIds < ActiveRecord::Migration
  def change
    add_column :rfp_ratings, :user_id, :integer
    add_column :rfp_ratings, :rfp_id, :integer
  end
end
