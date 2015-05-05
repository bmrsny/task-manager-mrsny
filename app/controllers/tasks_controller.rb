class TasksController < ApplicationController
  def new
    #list = List.find(params[:format])
    @task = Task.new(list_id: params[:format])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success]= "added the new task"
      redirect_to lists_path
    else
      flash[:error]
      redirect_to new_task_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :list_id)
  end
end
