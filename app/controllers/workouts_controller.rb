class WorkoutsController < ApplicationController

  before_action :trainer_login, except: [:index, :show]

  def new
    @days = Day.where(trainer_profile_id: current_customer_profile.id)
  end

  def create
    @workout = Workout.create!(
        name: params[:workout][:name],
        difficulty: params[:workout][:difficulty],
        purpose: params[:workout][:purpose],
        trainer_profile_id: current_customer_profile.id
      )
    params[:workout][:day_id].values.each do |id|
      day = Day.find(id)
      @workout.days.push(day)
    end
    @workout.day_count = @workout.days.length
    @workout.save
  end

end