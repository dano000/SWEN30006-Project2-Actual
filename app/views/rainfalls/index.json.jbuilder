json.array!(@rainfalls) do |rainfall|
  json.extract! rainfall, :id, :current, :weather_id
  json.url rainfall_url(rainfall, format: :json)
end
