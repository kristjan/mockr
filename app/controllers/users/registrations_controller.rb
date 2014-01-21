class Users::RegistrationsController < Devise::RegistrationsController
  # New users won't be in any organizations yet
  skip_before_filter :require_organization

  before_filter :configure_permitted_parameters

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name) }
  end
end
