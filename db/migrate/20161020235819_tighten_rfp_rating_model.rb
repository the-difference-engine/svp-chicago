class TightenRfpRatingModel < ActiveRecord::Migration
  def change
    change_column :rfp_ratings, :q13, :text
    remove_column :rfp_ratings, :invite?, :boolean
    add_column :rfp_ratings, :q8_notes, :text
    add_column :rfp_ratings, :q10_notes, :text
  end
end
