class TrainerProfilesController < ApplicationController

  before_action :trainer_login

  def new
    @trainer_profile = TrainerProfile.new
  end

  def create
    @trainer_profile = TrainerProfile.create!(trainer_profile_params)
    redirect_to trainer_profile_path(@trainer_profile.id)
  end

  def show
    @trainer_profile = TrainerProfile.find(params[:id])
    @workouts = @trainer_profile.workouts
  end

  private

  def trainer_profile_params
    params.require(:trainer_profile).permit(
      :customer_id,
      :name,
      :gym_name,
      :gym_postcode,
      :years_experience,
      :qualification,
      :rate,
      :bio
      )
  end

end