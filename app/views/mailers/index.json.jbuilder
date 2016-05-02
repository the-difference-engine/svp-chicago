json.array!(@mailers) do |mailer|
  json.extract! mailer, :id, :name, :email, :login
  json.url mailer_url(mailer, format: :json)
end
