class RemoveAttachmentFileUpdatedAt < ActiveRecord::Migration
  def change
    remove_column :attachments, :attachment_file_updated_at, :datetime
  end
end
