json.array!(@tutorials) do |tutorial|
  json.extract! tutorial, :id, :title, :tutorial_level, :user_id, :topic_id
  json.url tutorial_url(tutorial, format: :json)
end
