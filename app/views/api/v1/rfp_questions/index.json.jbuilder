json.array! @rfp_questions do |rfp_question|
  json.section rfp_question.rfp_section.name
  json.id rfp_question.id
  json.rfp_question rfp_question.question

  if !rfp_question.sub_questions.empty?
    json.sub_questions rfp_question.sub_questions
  end

end