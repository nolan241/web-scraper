class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :title
      t.string :price
      t.string :image_url
      t.text :overview
      t.string :miles
      t.integer :user_id

      t.timestamps
    end
  end
end
