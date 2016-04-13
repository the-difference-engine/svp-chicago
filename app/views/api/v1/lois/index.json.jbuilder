json.array! @lois do |loi|
	json.id loi.id
	json.name loi.name
	json.email loi.email
	
	json.answers loi.answers do |answer|
		json.question_id answer.question_id
		json.answer answer.answer
	end

	json.ratings loi.ratings do |rating|
		json.fits_SVP_criteria rating.q1
		json.potential_svp_impact rating.q2
		json.level_of_excitement rating.q3
		json.benefit_to_SVP rating.q4
		json.invite_to_RFP rating.q5
		json.weighted_score rating.weighted_score
	end
end
