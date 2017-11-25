class WorkoutsController < ApplicationController

  def new
    @days = Day.all
  end

  def create
    @workout = Workout.create!(
      name: params[:workout][:name],
      difficulty: params[:workout][:difficulty],
      purpose: params[:workout][:purpose])
    params[:workout][:day_id].values.each do |id|
      day = Day.find(id)
      @workout.days.push(day)
    end
    @workout.save
  end

end