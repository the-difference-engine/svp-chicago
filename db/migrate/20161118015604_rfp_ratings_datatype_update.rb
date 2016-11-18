class RfpRatingsDatatypeUpdate < ActiveRecord::Migration
  def change
    # change_column :rfp_ratings, :q8, :integer
    # change_column :rfp_ratings, :q10, :integer
    # change_column :rfp_ratings, :q12, :integer
    # change_column :rfp_ratings, :q13, :boolean
    # remove_column :rfp_ratings, :q8_notes, :text
    # rename_column :rfp_ratings, :q10_notes, :follow_up
    remove_column :rfp_ratings, :q8_notes, :text
    remove_column :rfp_ratings, :q8, :boolean
    remove_column :rfp_ratings, :q10, :boolean
    remove_column :rfp_ratings, :q12, :boolean
    rename_column :rfp_ratings, :q10_notes, :follow_up
    add_column :rfp_ratings, :q8, :integer
    add_column :rfp_ratings, :q10, :integer
    add_column :rfp_ratings, :q12, :integer
  end
end
