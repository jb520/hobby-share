# == Schema Information
#
# Table name: hobby_follows
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hobby_id   :integer
#  user_id    :integer
#
class HobbyFollow < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :hobby, required: true, class_name: "Hobby", foreign_key: "hobby_id"

  # These are being done in the belongs_to methods. Those methods just return the user and hobby that correspond to this HobbyFollow.
  def member
    matching_user = User.where({ :id => self.user_id }).at(0)
    return matching_user
  end

  def followed
    matching_hobby = Hobby.where({ :id => self.hobby_id }).at(0)
    return matching_hobby
  end



end
