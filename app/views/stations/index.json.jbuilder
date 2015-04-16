json.array!(@stations) do |station|
  json.extract! station, :id, :name, :lat, :long
  json.url station_url(station, format: :json)
end
