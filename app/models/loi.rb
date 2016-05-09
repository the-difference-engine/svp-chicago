class Loi < ActiveRecord::Base
  has_many :answers
  has_many :ratings

  def fte_amount_1_total
    amount = 0
    answers.each do |answer|
      if answer.fte
        # amount += answer.fte.amount_1
      end
    end

    return amount
  end

  def fte_amount_2_total
    amount = 0
    answers.each do |answer|
      if answer.fte
        # amount += answer.fte.amount_2
      end
    end

    return amount
  end

  def fte_amount_3_total
    amount = 0
    answers.each do |answer|
      if answer.fte
        # amount += answer.fte.amount_3
      end
    end
    return amount
  end

  def org_name
    answers.find_by(question_id: Question.find_by(question: "Organization").id).answer
  end

  def self.to_csv
    attributes = %w{id name email}
    
    questions = Question.all
    attribute_questions = []
    questions.each do|question|
      attribute_questions << question.question
    end
    # attributes = ["id","name","email"]
    # answers.each do |answer|
    #   attributes << Question.find(answer.question_id)
    # end
    # attributes = ["id","name","email"]
    # answers.each do |answer|
    #   attributes << Question.find(answer.question_id)
    # end

    CSV.generate(headers: true) do |csv|
      csv << attributes + attribute_questions
      all.each do |loi|
        csv << loi.attributes.values_at(*attributes) + loi.answers.map(&:answer)
      end
    end
  end

end
