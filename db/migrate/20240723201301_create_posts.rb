class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hobby, null: false, foreign_key: true
      t.text :body
      t.string :image
      t.integer :like_counter

      t.timestamps
    end
  end
end
