json.array!(@takes) do |take|
  json.extract! take, :id, :online, :person_id
  json.url take_url(take, format: :json)
end
