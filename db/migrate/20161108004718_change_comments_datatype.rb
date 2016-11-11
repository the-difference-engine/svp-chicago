class ChangeCommentsDatatype < ActiveRecord::Migration
  def change
    change_column :ratings, :comments, :text
    rename_column :ratings, :comments, :comment
  end
end
