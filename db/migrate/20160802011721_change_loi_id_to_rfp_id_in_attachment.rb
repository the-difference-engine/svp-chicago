class ChangeLoiIdToRfpIdInAttachment < ActiveRecord::Migration
  def change
    rename_column :attachments, :loi_id, :rfp_id 
  end
end
