class Attachment < ActiveRecord::Base
  def self.up
    add_attachment :attachments, :file
  end

  def self.down
    remove_attachment :attachments, :file
  end
end
