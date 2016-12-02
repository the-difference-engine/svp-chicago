class Q13ShouldBBoolean < ActiveRecord::Migration
  def change
    remove_column :rfp_ratings, :q13, :text
    add_column :rfp_ratings, :q13, :integer
  end
end
