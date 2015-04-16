json.array!(@weathers) do |weather|
  json.extract! weather, :id, :time, :station_id
  json.url weather_url(weather, format: :json)
end
