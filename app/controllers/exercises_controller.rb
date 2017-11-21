class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.create(exercise_params)
    unless @exercise.id == nil
      redirect_to exercise_path(@exercise.id)
    else
      render action: :new
    end
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def index
    @exercises = Exercise.limit(10).offset(0)
  end

  private

  def exercise_params
  params.require(:exercise).permit(
    :name,
    :muscle_group,
    :description,
    :category
    )
  end
end