class WorkoutsController < ApplicationController

  def new
    @exercises = Exercise.limit(20).offset(0)
    @workout = Workout.new
  end

end