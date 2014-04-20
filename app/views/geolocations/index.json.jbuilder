json.array!(@geolocations) do |geolocation|
  json.extract! geolocation, :id, :address, :latitude, :longitude, :borough, :neighborhood, :created_at, :updated_at
  json.url geolocation_url(geolocation, format: :json)
end
