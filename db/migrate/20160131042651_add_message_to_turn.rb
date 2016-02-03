class AddMessageToTurn < ActiveRecord::Migration
  def change
    add_column :turns, :message, :string
  end
end
