json.array! @rfps do |rfp|
  json.id rfp.id
  json.org_name rfp.org_name
  json.rfp_answers rfp.rfp_answers.each do |rfp_answer|

    json.rfp_question rfp_answer.rfp_question.question
    json.rfp_question_type rfp_answer.rfp_question.question_type
    json.rfp_answer rfp_answer.answer

    if rfp_answer.rfp_question.question_type == "block" || rfp_answer.rfp_question.question_type == "block with multiple inputs"
      json.sub_answers rfp_answer.sub_answers.each do |sub_answer|
        json.sub_answer sub_answer.answer
        json.sub_question sub_answer.sub_question.question
      end
    end
  end
end 


  
