json.array! @attachments do |attachment|
  json.id attachment.id
  json.name attachment.name
  json.url attachment.url
end