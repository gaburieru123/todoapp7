class TasksController < ApplicationController
  def index
  end

  def new
    @task = Task.new
  end
  
  def create
    task = Task.new(title: params[:title], detail: params[:detail])
    task.save
    redirect_to "/"
  end


end
