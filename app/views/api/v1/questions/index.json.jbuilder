json.array! @questions do |question|
	json.section question.section.name
	json.id question.id
  json.question question.question

end