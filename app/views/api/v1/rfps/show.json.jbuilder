json.id @rfp.id
json.user_id @rfp.user_id

json.array! @rfp_sections.each do |rfp_section|
  json.rfp_section rfp_section.name

  json.rfp_questions rfp_section.rfp_questions.each do |rfp_question|
    json.rfp_question rfp_question.question

    @rfp.rfp_answers.each do |rfp_answer|

      if rfp_answer.rfp_question_id == rfp_question.id
        json.rfp_answer = rfp_answer.answer

        if rfp_answer.sub_answers.length > 0

          json.sub_questions rfp_answer.sub_answers.each do |sub_answer|
            json.sub_question sub_answer.sub_question.question
            json.sub_answer sub_answer.answer
          end

        end
      end
    end
  end
end
