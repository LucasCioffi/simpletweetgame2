class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :user_id
      t.string :friend_username
      t.integer :board_id
      t.string :command
      t.integer :xpos
      t.integer :ypos

      t.timestamps null: false
    end
  end
end
