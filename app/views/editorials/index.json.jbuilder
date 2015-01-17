json.array!(@editorials) do |editorial|
  json.extract! editorial, :id, :name, :description, :country
  json.url editorial_url(editorial, format: :json)
end
