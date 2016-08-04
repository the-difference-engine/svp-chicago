class SubQuestion < ActiveRecord::Base

  belongs_to :rfp_question

  has_many :sub_answers

  validates :question, presence: true
  validates :rfp_question_id, presence: true
end
