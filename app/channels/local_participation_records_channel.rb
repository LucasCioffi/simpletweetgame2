class LocalParticipationRecordsChannel < ApplicationCable::Channel

  def subscribe(data)
    stop_all_streams
    stream_from "local_participation_record:#{data.id}"
  end

  def unsubscribe
    stop_all_streams
  end

end