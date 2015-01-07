json.array!(@years) do |year|
  json.extract! year, :id, :name
  json.url year_url(year, format: :json)
end
