module ApplicationHelper
  def current_customer_profile
    if current_customer.trainer
      TrainerProfile.find_by(customer_id: current_customer.id)
    else
      Profile.find_by(customer_id: current_customer.id)
    end
  end
end
