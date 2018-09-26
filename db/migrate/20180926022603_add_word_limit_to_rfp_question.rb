class AddWordLimitToRfpQuestion < ActiveRecord::Migration
  def change
    add_column :rfp_questions, :word_limit, :integer, :default => 150
  end
end
