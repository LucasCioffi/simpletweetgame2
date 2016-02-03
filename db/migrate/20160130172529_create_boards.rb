class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :username
      t.string :title
      t.text :description
      t.text :rooms_positions
      t.string :color
      t.string :background_image_url
      t.integer :height, :default => 100
      t.integer :width, :default => 100

      t.timestamps null: false
    end
  end
end
