class Loi < ActiveRecord::Base
  has_many :answers, -> { order "question_id" }
  has_many :ratings
  has_many :invited_lois
  belongs_to :user

  # validates :name, :email, presence: true

  # def fte_amount_1_total
  #   amount = 0
  #   answers.each do |answer|
  #     if answer.fte
  #       # amount += answer.fte.amount_1
  #     end
  #   end

  #   return amount
  # end

  # def fte_amount_2_total
  #   amount = 0
  #   answers.each do |answer|
  #     if answer.fte
  #       # amount += answer.fte.amount_2
  #     end
  #   end

  #   return amount
  # end

  # def fte_amount_3_total
  #   amount = 0
  #   answers.each do |answer|
  #     if answer.fte
  #       # amount += answer.fte.amount_3
  #     end
  #   end
  #   return amount
  # end

  def org_name
    answers.find_by(question_id: Question.find_by(question: "Organization").id).answer
  end

  def self.to_csv
    attributes = %w{id name email}

    questions = Question.order(:section_id).order(:id).all
    attribute_questions = []
    questions.each do|question|
      attribute_questions << question.question
    end

    CSV.generate(headers: true) do |csv|
      csv << attributes + attribute_questions
      all.each do |loi|
        attribute_answers = []
        sorted_answers = loi.answers.sort_by &:id
        sorted_answers.each do |answer|
          if answer.challenges.empty?
            attribute_answers << answer.answer
          else
            challenges = ""
            answer.challenges.each do |challenge|
              challenges += "#{challenge.challenge}: #{challenge.priority}. "
            end

            if answer.fte
              challenges += concat_ftes(answer.fte)
            end

            attribute_answers << challenges
          end
        end
        csv << loi.attributes.values_at(*attributes) + attribute_answers
        # csv << loi.attributes.values_at(*attributes) + loi.answers.map(&:answer)
      end
    end
  end

  def friendly_loi_time
    updated_at.strftime("%m/%d/%Y")
  end

  def self.concat_ftes(fte)
    fte_string = ""
    if fte.amount_1
      fte_string += "\nFTEs 2017: #{fte.amount_1}"
    end

    if fte.amount_2
      fte_string += "\nFTEs 2018: #{fte.amount_2}"
    end

    if fte.amount_3
      fte_string += "\nFTEs 2019: #{fte.amount_3}"
    end

    fte_string
  end
end
