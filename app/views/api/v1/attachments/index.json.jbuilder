json.array! @attachments do |attachment|
  json.id attachment.id
  json.user_id attachment.user_id
  json.rfp_id attachment.rfp_id
  json.name attachment.name
  json.url attachment.url
end