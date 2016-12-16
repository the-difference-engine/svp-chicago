class Rfp < ActiveRecord::Base
  belongs_to :user
  has_many :rfp_sections
  has_many :rfp_answers
  has_many :sub_questions
  has_many :sub_answers
  has_many :rfp_ratings

  def org_name
    rfp_answer = rfp_answers.find_by(rfp_question_id: RfpQuestion.find_by(question: "Organization").id)
    if rfp_answer
      return rfp_answer.answer
    else
      return "No Name Submitted"
    end
  end

  

  def friendly_loi_time
    updated_at.strftime("%m/%d/%Y")
  end

end
