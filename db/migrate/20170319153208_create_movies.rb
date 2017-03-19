class CreateMovies < ActiveRecord::Migration[5.0]
  
  #rails generate scaffold movie title:string
      #main categorizaion and purpose of table
  # hotness:integer image_url:string synopsis:text rating:string genre:string director:string runtime:string 
      #additional attributes
  #user_id:integer 
      #associate users
  #--no-stylesheets
      #avoid the default rails css rules.
      
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :hotness
      t.string :image_url
      t.text :synopsis
      t.string :rating
      t.string :genre
      t.string :director
      t.string :runtime
      t.integer :user_id

      t.timestamps
    end
  end
end
