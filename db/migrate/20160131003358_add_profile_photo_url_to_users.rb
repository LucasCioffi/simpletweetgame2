class AddProfilePhotoUrlToUsers < ActiveRecord::Migration
  def up
    add_column :users, :profile_photo_url, :text, after: :username
    add_column :users, :twitter_user_id, :string, after: :username
  end
  def down
    remove_column :users, :profile_photo_url
    remove_column :users, :twitter_user_id
  end
end
