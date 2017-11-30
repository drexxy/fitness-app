class DaysController < ApplicationController

  before_action :trainer_login

  def new
    if current_customer_profile
      @exercises = Exercise.all
    else
      flash[:notice] = "You must create a profile first"
      redirect_to new_trainer_profile_path
    end
  end

  def create
    @day = Day.create!(
      name: params[:day][:name],
      trainer_profile_id: current_customer_profile.id
    )

    sets = params[:set_exercise][:set].values
    reps = params[:set_exercise][:reps].values
    exercises = params[:set_exercise][:exercise_id].values

    sets_reps = sets.zip(reps, exercises)

    sets_reps.each do |set_rep|
      SetExercise.create!(
        day_id: @day.id,
        sets: set_rep[0],
        reps: set_rep[1],
        exercise_id: set_rep[2])
    end

    redirect_to days_path
  end

  def index
    @days = Day.where(
      trainer_profile_id: current_customer_profile.id).limit(20).offset(0).includes(:set_exercises).includes(:exercises)
    @days = @days.to_json(
      only: [:name], include: {
      set_exercises: { only: [:sets, :reps], include: {
      exercise: {only: [:name]}}}})
  end

end