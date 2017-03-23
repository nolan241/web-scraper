json.extract! vehicle, :id, :title, :price, :image_url, :overview, :miles, :user_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
