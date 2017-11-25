class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |customer_params|
      customer_params.permit(:trainer, :email, :password, :password_confirmation)
    end
  end

end
