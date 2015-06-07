json.array!(@keyword_tutorials) do |keyword_tutorial|
  json.extract! keyword_tutorial, :id, :tutorial_id, :keyword_id
  json.url keyword_tutorial_url(keyword_tutorial, format: :json)
end
