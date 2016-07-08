class CreateInviteMaxes < ActiveRecord::Migration
  def change
    create_table :invite_maxes do |t|
      t.integer :max

      t.timestamps null: false
    end
  end
end
