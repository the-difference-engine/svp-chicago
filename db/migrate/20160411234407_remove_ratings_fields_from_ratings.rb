class RemoveRatingsFieldsFromRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :rating_fields, :string
  end
end
