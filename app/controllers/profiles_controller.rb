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
    if @profile.workout_id
      @workout = @profile.workout
    end
  end

  def matches
    @workouts = Workout.where(
      "purpose= ? AND difficulty = ? AND day_count = ?", 
      current_customer_profile.goal.name,
      current_customer_profile.experience,
      current_customer_profile.days
    ).limit(5).offset(0).includes(:days).includes(:set_exercises).includes(:exercises)

    @workouts = @workouts.to_json(
      except: [:created_at, :updated_at], include: {
        days:{ only: [:name], include: {
      set_exercises: { only: [:sets, :reps], include: {
      exercise: {only: [:name]}}}}}}
      )
  
  end

  def workouts
    @profile = current_customer_profile
    @profile.workout_id = params[:workout_id]
    @profile.save
    redirect_to(profile_path(current_customer_profile.id))
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