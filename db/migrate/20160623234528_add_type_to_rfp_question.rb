class AddTypeToRfpQuestion < ActiveRecord::Migration
  def change
    add_column :rfp_questions, :type, :string
  end
end
