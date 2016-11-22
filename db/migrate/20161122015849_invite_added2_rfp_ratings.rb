class InviteAdded2RfpRatings < ActiveRecord::Migration
  def change
    add_column :rfp_ratings, :invited, :boolean
  end
end
