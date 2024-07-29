# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
class Comment < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :post, required: true, class_name: "Post", foreign_key: "post_id"

  def poster
    matching_user = User.where({ :id => self.user_id }).at(0)
    return matching_user
  end
end
