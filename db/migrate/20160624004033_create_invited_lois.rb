class CreateInvitedLois < ActiveRecord::Migration
  def change
    create_table :invited_lois do |t|
      t.integer :loi_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
