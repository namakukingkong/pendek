json.array!(@urls) do |url|
  json.extract! url, :id, :origin, :short, :infos
  json.url url_url(url, format: :json)
end
