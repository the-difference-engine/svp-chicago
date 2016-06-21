class AddSubmittedtoLoi < ActiveRecord::Migration
  def change
    add_column :lois, :submitted, :boolean, default: false
  end
end
