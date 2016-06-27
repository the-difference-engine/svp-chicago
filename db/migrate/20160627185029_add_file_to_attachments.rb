class AddFileToAttachments < ActiveRecord::Migration
  def change
    def self.up
      add_attachment :attachments, :file
    end

    def self.down
      remove_attachment :attachments, :file
    end
  end
end
