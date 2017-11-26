class GoalsController < ApplicationController

  before_action :admin_login

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(name: params[:goal][:name])
  end
end