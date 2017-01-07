class Attachment < ActiveRecord::Base
  # code below is for using Paperclip:
  # has_attached_file :attachment_file  
  # do_not_validate_attachment_file_type :attachment_file
  belongs_to :rfp
end
