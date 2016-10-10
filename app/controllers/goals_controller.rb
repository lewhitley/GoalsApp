class GoalsController < ApplicationController

  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
    render :new
  end

  def create
    goal = Goal.new(goal_params)
    goal.user_id = current_user.id
    if goal.save
      redirect_to goal_url(goal)
    else
      flash.now[:errors] = goal.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

  private

  def set_goal
    @goal = goal.find_by_id(prams[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :body, :blobby, :finished, :user_id)
  end
end
