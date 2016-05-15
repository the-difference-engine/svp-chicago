json.array! @lois do |loi|
	json.id loi.id
	json.name loi.name
	json.email loi.email
	json.org_name loi.org_name
	
	json.answers do
		loi.answers.each do |answer|
			json.set! answer.question_id, answer.answer
				if !answer.challenges.empty?
					json.set! answer.question_id, [answer.challenges, answer.fte]
				end			
		end
	end

	json.ratings loi.ratings do |rating|
		json.id rating.id
		json.user_id rating.user_id
		json.loi_id rating.loi_id
		json.q1 rating.q1
		json.q2 rating.q2
		json.q3 rating.q3
		json.q4 rating.q4
		json.q5 rating.q5
		json.weighted_score rating.weighted_score
	end
end