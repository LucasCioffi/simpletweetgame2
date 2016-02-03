json.array!(@boards) do |board|
  json.extract! board, :id, :username, :title, :description, :rooms_positions, :color, :background_image_url
  json.url board_url(board, format: :json)
end
