class UsersController < ApplicationController
  before_action :set_user, :user_params

  # remove unused code
  # def dashboard
  #   feed_hobby = @user.followed_hobbies
  #   feed_posts = feed_hobby.each do |hobby|
  #     hobby.posts.all
  #   end
  #   @feed = feed_posts.order(updated_at: :desc)
  # end
  #
  def update
  end
  #
  def edit
  end
  #
  private

  def set_user
    @users = User.all
    if params[:id]
      @user = User.find_by!(id: params.fetch(:id))
    else
      @user = current_user
    end
  end

  def user_params
    params.permit(:image)
  end

end
