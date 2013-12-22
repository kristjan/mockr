class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name) }
  end
end
