class IncompleteTasksController < ApplicationController
  def update
    @task = Task.find(params[:id])
    @task.update_attributes(status: false)
    render json: @task
  end
end
