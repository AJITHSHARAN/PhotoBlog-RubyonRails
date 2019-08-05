class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :user_id, null: false 
      t.string :title, null: false
      t.string :image_url, null: false
      t.string :iso, null: false 
      t.string :shutterspeed, null: false
      t.string :aperture, null: false  
    end
  end
end
