class LocalParticipationRecord < ActiveRecord::Base
  belongs_to :board
  belongs_to :user

  after_commit { LocalParticipationRecordRelayJob.perform_later(self) }
end
