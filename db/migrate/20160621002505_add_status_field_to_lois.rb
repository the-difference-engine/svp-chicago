class AddStatusFieldToLois < ActiveRecord::Migration
  def change
    add_column :lois, :status, :boolean
  end
end
