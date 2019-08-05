class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
     t.string :user_id,  null: false
     t.string :post_id, null: false
    end
    add_index :likes, [:user_id, :post_id], unique: true
  end
end
