class DaysController < ApplicationController

  def new
    @exercises = Exercise.all
  end

  def create
    @day = Day.create!(name: params[:day][:name])
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
    @days = Day.limit(20).offset(0).includes(:set_exercises).includes(:exercises)
    @days = @days.to_json(
      except: [:created_at, :updated_at], include: {
      set_exercises: { except: [:created_at, :updated_at], include: {
      exercise: {except: [:created_at, :updated_at, :description]}}}})
  end

end