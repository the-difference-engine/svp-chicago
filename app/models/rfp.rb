class Rfp < ActiveRecord::Base
  belongs_to :user
  has_many :rfp_sections
  has_many :rfp_answers
  has_many :sub_questions
  has_many :sub_answers

  def org_name
    rfp_answers.find_by(rfp_question_id: RfpQuestion.find_by(question: "Organization").id).answer
  end



end
