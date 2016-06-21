json.id @loi.id
json.name @loi.name
json.email @loi.email
json.status @loi.status

json.answers @loi.answers do |answer|
	json.question_id answer.question_id
	json.answer answer.answer
end
json.ratings @loi.ratings do |rating|
	json.fits_SVP_criteria rating.q1
	json.potential_svp_impact rating.q2
	json.level_of_excitement rating.q3
	json.benefit_to_SVP rating.q4
	json.invite_to_RFP rating.q5
	json.weighted_score rating.weighted_score
end

json.contact_answers @contact_answers do |answer|
  json.id answer.id
  json.question answer.question
  json.answer answer.answer
end

json.organization_answers @organization_answers do |answer|
  json.id answer.id
  json.question answer.question
  json.answer answer.answer
end

json.overview_answers @overview_answers do |answer|
  json.id answer.id
  json.question answer.question
  json.answer answer.answer
end

json.vision_answers @vision_answers do |answer|
  json.id answer.id
  json.question answer.question
  json.answer answer.answer
end

json.concern_answers @concern_answers do |answer|
  json.id answer.id
  json.question answer.question
  json.answer answer.answer
end

json.challenge_answers @challenge_answers do |answer|
  json.id answer.id
  json.question answer.question
  json.answer answer.answer
  json.fte answer.fte
  json.challenges answer.challenges
end

json.referral_answers @referral_answers do |answer|
  json.id answer.id
  json.question answer.question
  json.answer answer.answer
end

json.demographic_answers @demographic_answers do |answer|
  json.id answer.id
  json.question answer.question
  json.answer answer.answer
end

json.geographic_answers @geographic_answers do |answer|
  json.id answer.id
  json.question answer.question
  json.answer answer.answer
end