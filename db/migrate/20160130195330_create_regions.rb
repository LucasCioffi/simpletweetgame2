class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.integer :top_left_x
      t.integer :top_left_y
      t.integer :height
      t.integer :width
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
