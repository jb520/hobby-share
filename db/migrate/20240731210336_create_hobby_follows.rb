class CreateHobbyFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :hobby_follows do |t|

      t.timestamps
      t.integer :user_id
      t.integer :hobby_id
    end
  end
end
