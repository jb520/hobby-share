# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  bio                    :text
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  image                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :likes, class_name: "Like", foreign_key: "user_id", dependent: :destroy
  has_many  :posts, class_name: "Post", foreign_key: "user_id", dependent: :destroy
  has_many  :comments, class_name: "Comment", foreign_key: "user_id", dependent: :destroy
  has_many :hobby_follows, class_name: "HobbyFollow", foreign_key: "user_id", dependent: :destroy

  has_many :followed_hobbies, through: :hobby_follows, source: :hobby

  validates :username, presence: true, uniqueness: true
  validates :image, presence: true

  def my_hobbies
    matched = HobbyFollow.where({ :user_id => self.id })
    return matched
  end
  
end
