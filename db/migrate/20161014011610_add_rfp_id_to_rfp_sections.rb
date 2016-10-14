class AddRfpIdToRfpSections < ActiveRecord::Migration
  def change
    add_column :rfp_sections, :rfp_id, :integer
  end
end
