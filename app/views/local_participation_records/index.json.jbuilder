json.array!(@local_participation_records) do |local_participation_record|
  json.extract! local_participation_record, :id, :user_id, :board_id, :num_moves, :num_invites, :xpos, :ypos
  json.url local_participation_record_url(local_participation_record, format: :json)
end
