class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resouce)
    root_path
  end

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :username])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:username])
  end
end
