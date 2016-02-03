class AddLocalParticipationRecordToTurn < ActiveRecord::Migration
  def change
    add_column :turns, :local_participation_record_id, :integer
  end
end
