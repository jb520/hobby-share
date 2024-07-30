class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :hobby_id
      t.text :body
      t.integer :like_counter
      t.string :image

      t.timestamps
    end
  end
end
