# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  body         :text
#  image        :string
#  like_counter :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  hobby_id     :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_posts_on_hobby_id  (hobby_id)
#  index_posts_on_user_id   (user_id)
#
# Foreign Keys
#
#  hobby_id  (hobby_id => hobbies.id)
#  user_id   (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :hobby, required: true, class_name: "Hobby", foreign_key: "hobby_id"

  has_many  :likes, class_name: "Like", foreign_key: "post_id", dependent: :destroy
  has_many  :comments, class_name: "Comment", foreign_key: "post_id", dependent: :destroy
end
