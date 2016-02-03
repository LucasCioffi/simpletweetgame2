class RenameUsernameInBoards < ActiveRecord::Migration
  def up
    remove_column :boards, :username
    add_column :boards, :user_id, :integer, :before => :title
  end
  def down
    remove_column :boards, :user_id, :integer
    add_column :boards, :username, :string
  end
end
