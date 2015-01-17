json.array!(@authors) do |author|
  json.extract! author, :id, :name, :date_of_birth, :number_of_books
  json.url author_url(author, format: :json)
end
