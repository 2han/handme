json.array!(@users) do |user|
  json.extract! user, :name, :email, :password_digest, :remember_token, :age, :introduction
  json.url user_url(user, format: :json)
end