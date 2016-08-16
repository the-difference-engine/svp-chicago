class AddAttachmentUrlAndAttachmentNameToRfp < ActiveRecord::Migration
  def change
    add_column :rfps, :attachment_url, :string
    add_column :rfps, :attachment_name, :string
  end
end
