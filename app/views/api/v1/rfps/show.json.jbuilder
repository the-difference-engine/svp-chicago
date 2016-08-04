json.id @rfp.id

json.user_id @rfp.user_id

json.answers @rfp.rfp_answers do |answer|
  json.question answer.rfp_question
  if answer.rfp_question.question_type == "block"
    answer.rfp_question.sub_questions.each do |sub_question|
      json.sub_question sub_question
      sub_question.sub_answers.each do |sub_answer|
        json.sub_answer sub_answer
      end 
    end 
  end
  json.answer answer.answer
end