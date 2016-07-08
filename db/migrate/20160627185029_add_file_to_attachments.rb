class AddFileToAttachments < ActiveRecord::Migration
  def self.up
    add_attachment :attachments, :avatar
  end

  def self.down
    remove_attachment :attachments, :avatar
  end
end
