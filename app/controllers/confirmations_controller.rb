class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    if resource.trainer
      new_trainer_profile_path
    else
      new_profile_path 
    end
  end
end