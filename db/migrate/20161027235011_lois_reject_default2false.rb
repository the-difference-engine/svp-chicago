class LoisRejectDefault2false < ActiveRecord::Migration
  def change
    change_column :lois, :reject, :boolean, default: false
  end
end
