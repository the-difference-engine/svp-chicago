json.array! @ratings do |rating|
  json.id rating.id
  json.rfp_id rating.rfp_id
  json.org_name rating.rfp.org_name
  json.user rating.user
  json.q1 rating.q1
  json.q2 rating.q2
  json.q3 rating.q3
  json.q4 rating.q4
  json.q5 rating.q5
  json.q6 rating.q6
  json.q7 rating.q7
  json.q8 rating.q8
  json.q9 rating.q9
  json.q10 rating.q10
  json.q11 rating.q11
  json.q12 rating.q12
  json.follow_up rating.follow_up
  json.weighted_score rating.weighted_score
end
