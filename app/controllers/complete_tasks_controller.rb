class CompleteTasksController < ApplicationController
  def index
    @tasks = Task.where(status: true)
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(status: true)
    render json: @tasks
  end
end
