class ProfilesController < ApplicationController

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
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(
      :display_name,
      :goal_id
      )
  end

end