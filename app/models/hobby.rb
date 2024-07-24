# == Schema Information
#
# Table name: hobbies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Hobby < ApplicationRecord
  has_many  :posts, class_name: "Post", foreign_key: "hobby_id", dependent: :destroy
end
