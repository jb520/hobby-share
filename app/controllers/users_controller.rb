class UsersController < ApplicationController
  before_action :set_user
  # def dashboard
  #   @user = current_user
  # end
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

end
