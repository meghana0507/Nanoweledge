json.array!(@rate_user_tutorials) do |rate_user_tutorial|
  json.extract! rate_user_tutorial, :id, :tutorial_id, :user_id, :score
  json.url rate_user_tutorial_url(rate_user_tutorial, format: :json)
end
