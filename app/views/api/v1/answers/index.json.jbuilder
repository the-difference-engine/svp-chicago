
json.array! @answers do |answer|

  json.id answer.id
  json.loi_id answer.loi_id
  json.question_id answer.question_id
  json.question answer.question
  json.answer answer.answer

end