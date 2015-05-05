class CompleteTasksController < ApplicationController

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(status: true)
    render json: @tasks
  end
end
