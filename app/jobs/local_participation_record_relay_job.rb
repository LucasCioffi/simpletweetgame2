class LocalParticipationRecordRelayJob
  def perform(lpr)
    lpr_json = '{
        user: {
            username: "simple test",
            twitter_user_id: "SimpleTest10"
        },
        xpos: 50,
        ypos: 50
    }'
    ActionCable.server.broadcast "local_participation_record:#{lpr.id}",
                                 local_participation_record: lpr_json
  end
end