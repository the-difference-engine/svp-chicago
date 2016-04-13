gjson.array! @lois do |loi|
	json.id loi.id
	json.name loi.name
	json.email loi.email
	
	json.answers loi.answers do |answer|
		json.question_id answer.question_id
		json.answer answer.answer
	end
end
