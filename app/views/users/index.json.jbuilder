json.array!(@users) do |user|
  json.extract! user, :id, :pw, :user_name, :email
  json.url user_url(user, format: :json)
end
