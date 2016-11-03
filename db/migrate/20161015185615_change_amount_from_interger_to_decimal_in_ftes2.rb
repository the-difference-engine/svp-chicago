class ChangeAmountFromIntergerToDecimalInFtes2 < ActiveRecord::Migration
  def change
    change_column :ftes, :amount_1, :decimal, :precision => 10, :scale => 2    
    change_column :ftes, :amount_2, :decimal, :precision => 10, :scale => 2
    change_column :ftes, :amount_3, :decimal, :precision => 10, :scale => 2
  end
end
