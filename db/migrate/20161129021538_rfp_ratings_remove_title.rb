class RfpRatingsRemoveTitle < ActiveRecord::Migration
  def change
    remove_column :rfp_ratings, :title, :string
  end
end
