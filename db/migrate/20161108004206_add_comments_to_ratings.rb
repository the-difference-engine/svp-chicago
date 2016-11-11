class AddCommentsToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :comments, :string
  end
end
