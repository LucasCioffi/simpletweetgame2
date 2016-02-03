class CreateLocalParticipationRecords < ActiveRecord::Migration
  def change
    create_table :local_participation_records do |t|
      t.integer :user_id
      t.integer :board_id
      t.integer :num_moves
      t.integer :num_invites
      t.integer :xpos
      t.integer :ypos

      t.timestamps null: false
    end
  end
end
