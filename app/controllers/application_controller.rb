class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end




end

Refile.secret_key = '20e60dc7ce3f4b2871a94a5996b860ed5c519d147cffc78efd74e54dd1b0c6d52517e58db2b1fc02c43dadc3a06918e60f84724f6526b649ae1bc20c78e9432c'