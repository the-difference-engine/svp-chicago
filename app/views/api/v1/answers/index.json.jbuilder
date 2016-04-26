json.array! @answers do |answer|
  json.id answer.id
  json.question_id answer.question_id 
  json.answer answer.answer

end