class AddSubmittedToRfp < ActiveRecord::Migration
  def change
    add_column :rfps, :submitted, :boolean
  end
end
