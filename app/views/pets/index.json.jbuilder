json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :photoUrls, :category, :status, :tags
  json.url pet_url(pet, format: :json)
end
