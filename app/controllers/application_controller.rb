class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    render json: {warning: exception, status: "Authorization failed"}
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :role])
  end
end
