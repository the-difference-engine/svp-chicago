json.array! @ratings do |rating|
  json.id rating.id
  json.loi rating.rfp_id
  json.org_name rating.rfp.org_name
  json.user rating.user
  json.q1 rating.q1
  json.q2 rating.q2
  json.q3 rating.q3
  json.q4 rating.q4
  json.q5 rating.q5
  json.q5 rating.q6
  json.q5 rating.q7
  json.q5 rating.q8
  json.q5 rating.q9
  json.q5 rating.q10
  json.q5 rating.q11
  json.q5 rating.q12
  json.q5 rating.q13
end