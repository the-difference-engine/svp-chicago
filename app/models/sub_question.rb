class SubQuestion < ActiveRecord::Base

  belongs_to :rfp_question, -> { order "id" }

  has_many :sub_answers

  validates :question, presence: true
  validates :rfp_question_id, presence: true
end
