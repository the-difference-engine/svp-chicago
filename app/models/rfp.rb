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
    end
  end

  # def self.to_csv
  #   attributes = %w{id name email}
    
  #   questions = Question.order(:section_id).order(:id).all
  #   attribute_questions = []
  #   questions.each do|question|
  #     attribute_questions << question.question
  #   end

  #   CSV.generate(headers: true) do |csv|
  #     csv << attributes + attribute_questions
  #     all.each do |loi|
  #       attribute_answers = []
  #       loi.answers.each do |answer|
  #         if answer.challenges.empty?
  #           attribute_answers << answer.answer
  #         else
  #           challenges = ""
  #           answer.challenges.each do |challenge|
  #             challenges += "#{challenge.challenge}: #{challenge.priority}. "
  #           end

  #           if answer.fte
  #             challenges += concat_ftes(answer.fte)
  #           end

  #           attribute_answers << challenges
  #         end
  #       end
  #       csv << loi.attributes.values_at(*attributes) + attribute_answers
  #     end
  #   end
  # end


  def friendly_loi_time
    updated_at.strftime("%m/%d/%Y")
  end

end
