json.array!(@read_user_tutorials) do |read_user_tutorial|
  json.extract! read_user_tutorial, :id, :tutorial_id, :user_id
  json.url read_user_tutorial_url(read_user_tutorial, format: :json)
end
