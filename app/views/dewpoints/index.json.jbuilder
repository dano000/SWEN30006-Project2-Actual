json.array!(@dewpoints) do |dewpoint|
  json.extract! dewpoint, :id, :current, :weather_id
  json.url dewpoint_url(dewpoint, format: :json)
end
