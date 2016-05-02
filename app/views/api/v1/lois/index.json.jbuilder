json.array! @lois do |loi|
	json.id loi.id
	json.name loi.name
	json.email loi.email
	
	json.answers loi.answers do |answer|
		json.question_id answer.question_id
		json.answer answer.answer
	end

	json.ratings loi.ratings do |rating|
		json.q1 rating.q1
		json.q2 rating.q2
		json.q3 rating.q3
		json.q4 rating.q4
		json.q5 rating.q5
		json.weighted_score rating.weighted_score
	end
end
