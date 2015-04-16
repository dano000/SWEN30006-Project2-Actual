json.array!(@windspeeds) do |windspeed|
  json.extract! windspeed, :id, :current, :weather_id
  json.url windspeed_url(windspeed, format: :json)
end
