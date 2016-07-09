class RemoveAttachmentFileFileNameAttachmentFileContentTypeAndAttachmentFileFileSize < ActiveRecord::Migration
  def change
    remove_column :attachments, :attachment_file_file_name
    remove_column :attachments, :attachment_file_content_type
    remove_column :attachments, :attachment_file_file_size
  end
end
