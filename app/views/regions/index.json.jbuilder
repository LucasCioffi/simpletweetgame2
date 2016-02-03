json.array!(@regions) do |region|
  json.extract! region, :id, :top_left_x, :top_left_y, :height, :width, :title, :description
  json.url region_url(region, format: :json)
end
