class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |customer_params|
      customer_params.permit(:trainer, :email, :password, :password_confirmation)
    end
  end

  private

  def admin_login
    unless session[:admin_id]
      flash[:error] = "This area requires admin privileges"
      redirect_to exercises_path 
    end
  end

  

end
