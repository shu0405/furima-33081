class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :first_name, :surname_name, :katakana_first_name, :katakana_surname_name])
  end
end
