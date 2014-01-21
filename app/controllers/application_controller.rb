class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_filter :require_organization

private

  def require_organization
    redirect_to new_organization_path unless current_user.organizations.any?
  end
end
