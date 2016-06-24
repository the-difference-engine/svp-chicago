json.array! @invited_lois do |invited_loi|
  json.id invited_loi.id
  json.loi_id invited_loi.loi_id
  json.status invited_loi.status
end