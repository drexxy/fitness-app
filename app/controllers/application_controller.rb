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

  def customer_login
    unless current_customer && current_customer.trainer == false
      flash[:error] = "You must sign in"
      redirect_to new_customer_session_path 
    end
  end

  def trainer_login
    unless current_customer && current_customer.trainer
      flash[:error] = "You must sign in as a personal trainer"
      redirect_to new_customer_session_path 
    end
  end

  def current_customer_profile
    if current_customer.trainer
      TrainerProfile.find_by(customer_id: current_customer.id)
    else
      Profile.find_by(customer_id: current_customer.id)
    end
  end

end
