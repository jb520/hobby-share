class ApplicationController < ActionController::Base
  # Hi its me, the code reviewer
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_forgery_protection

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username, :image, :bio])
    devise_parameter_sanitizer.permit(:account_update, :keys => [:username, :image, :bio])
  end
end
