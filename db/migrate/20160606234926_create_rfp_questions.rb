class CreateRfpQuestions < ActiveRecord::Migration
  def change
    create_table :rfp_questions do |t|
      t.integer :rfp_section_id
      t.string  :question 
      
      t.timestamps null: false
    end
  end
end
