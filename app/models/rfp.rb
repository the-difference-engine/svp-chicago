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

  def self.to_csv
    attributes = %w{id submitted}

    questions = RfpQuestion.order(:rfp_section_id).order(:id).all
    attribute_questions = []
    questions.each do |question|
      attribute_questions << question.question
    end

    CSV.generate(headers: true) do |csv|
      csv << attributes + attribute_questions
      all.each do |rfp|
        csv_row_answers = []
        csv_row_answers << rfp.id
        csv_row_answers << rfp.submitted
        questions.each do |question|

          if question.question_type == "multiple input"
            multi_input_answers = rfp.rfp_answers.where(rfp_question_id: question.id)
            multi_input_array = []
            multi_input_answers.each do |multi_input_answer|
              multi_input_array << multi_input_answer.answer
            end
            csv_row_answers << multi_input_array.join(", ")

          elsif question.question_type == "block"
            sub_questions = SubQuestion.where(rfp_question_id: question.id)
            sub_string_array = []
            sub_questions.each do |sub_question|
              sub_answer = rfp.sub_answers.find_by(sub_question_id: sub_question.id)
              if sub_answer != nil
                sub_string_array << sub_question.question + ": " + sub_answer.answer
              end
            end
            csv_row_answers << sub_string_array.join(", ")

          elsif question.question_type == "block with multiple inputs"
            sub_string_array = []
            sub_questions = SubQuestion.where(rfp_question_id: question.id)
            sub_quest_count = sub_questions.count
            j = 0
            question_array = []
            quest_array = []
            answer_array = []
            
            question_string = ""
            sub_questions.each do |sub_question|
                question_string += sub_question.question + "/"
            end
          

            sub_quest_count.times do
              sub_answers = rfp.sub_answers.where(sub_question_id: sub_questions[j].id)
          
                sub_answer_count = sub_answers.count
                i = 0
                answer_string = ''
                sub_answer_count.times do
                  answer_array << sub_answers[i].answer
                  i+=1
                end
                j+=1
                         
            end

            ans_count = answer_array.length / 2
            count1 = (ans_count - ans_count)
            count2 = count1 + 1
            ans_array = []
            ans_array = answer_array.each_slice(ans_count).to_a
            ans_string = ''
            ans_string = ans_array[(count1)].zip(ans_array[count2])         
            question_string = question_string.chop!
            question_string += ":"
            question_array << question_string     
            sub_string_array << question_array
            sub_string_array.push(ans_string)
            csv_row_answers << sub_string_array.join(", ")

          else
            single_input_answer = rfp.rfp_answers.find_by(rfp_question_id: question.id)
            if single_input_answer != nil
              csv_row_answers << single_input_answer.answer
            else
              csv_row_answers << ""
            end
          end
        end
        csv.add_row(csv_row_answers)
      end
    end
  end
  
  def friendly_loi_time
    updated_at.strftime("%m/%d/%Y")
  end

end
