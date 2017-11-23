class DaysController < ApplicationController

  def new
    @exercises = Exercise.all
    @day = Day.new
  end

end