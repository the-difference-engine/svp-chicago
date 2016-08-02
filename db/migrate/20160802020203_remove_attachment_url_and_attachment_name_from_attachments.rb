class RemoveAttachmentUrlAndAttachmentNameFromAttachments < ActiveRecord::Migration
  def change
    remove_column :attachments, :attachment_url, :string
    remove_column :attachments, :attachment_name, :string
  end
end
