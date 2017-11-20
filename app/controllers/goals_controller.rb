class GoalsController < ApplicationController

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(name: params[:goal][:name])
  end
end