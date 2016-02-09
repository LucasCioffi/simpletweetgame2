class AddTwitterIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unique1, :string
    add_column :users, :unique2, :string
  end
end
