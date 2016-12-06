class RemoveQ13 < ActiveRecord::Migration
  def change
    remove_column :rfp_ratings, :q13, :integer
  end
end
