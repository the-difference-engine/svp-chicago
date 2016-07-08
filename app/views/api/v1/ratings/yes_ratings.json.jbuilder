json.array! @your_yes_ratings do |rating|
  json.id rating.id
  json.user_id rating.user_id
  json.q5 rating.q5
end