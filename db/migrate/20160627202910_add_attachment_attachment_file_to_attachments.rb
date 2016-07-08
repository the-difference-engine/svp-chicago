class AddAttachmentAttachmentFileToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.attachment :attachment_file
    end
  end

  def self.down
    remove_attachment :attachments, :attachment_file
  end
end
