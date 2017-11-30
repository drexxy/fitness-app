class ExercisesController < ApplicationController

  before_action :admin_login, except: [:index, :show]

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
    set_page
    set_limit
    @exercises = Exercise.limit(@limit).offset((@limit * (@page.to_i - 1)))
    @next_page = @page + 1
    @prev_page = @page - 1
    @final_page = (Exercise.count.to_f / @limit).ceil
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