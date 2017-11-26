class ProfilesController < ApplicationController
  
  before_action :customer_login, except: [:show]

  def new
    unless @profile
      @profile = Profile.new
    end
  end

  def create
    @profile = Profile.create(profile_params)
    unless @profile.id == nil
      redirect_to profile_path(@profile.id)
    else
      render action: :new
    end
  end

  def show
    @profile = Profile.find_by(customer_id: current_customer.id)
  end

  private

  def profile_params
    params.require(:profile).permit(
      :customer_id,
      :display_name,
      :goal_id,
      :days,
      :experience,
      :weight
      )
  end

end