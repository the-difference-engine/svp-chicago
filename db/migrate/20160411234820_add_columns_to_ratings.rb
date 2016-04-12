class AddColumnsToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :q1, :integer
    add_column :ratings, :q2, :integer
    add_column :ratings, :q3, :integer
    add_column :ratings, :q4, :integer
    add_column :ratings, :q5, :string
    add_column :ratings, :weighted_score, :integer
  end
end
