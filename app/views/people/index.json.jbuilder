json.array!(@people) do |person|
  json.extract! person, :id, :vk, :name
  json.url person_url(person, format: :json)
end
