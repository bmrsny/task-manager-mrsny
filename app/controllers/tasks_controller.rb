class TasksController < ApplicationController
  def new
    #list = List.find(params[:format])
    @task = Task.new(list_id: params[:format])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success]= "added the new task"
      redirect_to list_path(@task.list_id)
    else
      flash[:error]
      redirect_to new_task_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "you updated"
      redirect_to list_path(@task.list_id)
    else
      flash[:errors] = "could not update task at this time"
      redirect_to edit_task_path(@task)
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :list_id)
  end
end
