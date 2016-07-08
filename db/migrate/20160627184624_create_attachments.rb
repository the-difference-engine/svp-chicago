class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :user_id
      t.integer :loi_id

      t.timestamps null: false
    end
  end
end
