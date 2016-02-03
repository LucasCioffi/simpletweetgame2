json.array!(@turns) do |turn|
  json.extract! turn, :id, :user_id, :friend_username, :board_id, :command, :xpos, :ypos
  json.url turn_url(turn, format: :json)
end
