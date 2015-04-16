json.array!(@winddirs) do |winddir|
  json.extract! winddir, :id, :current, :weather_id
  json.url winddir_url(winddir, format: :json)
end
