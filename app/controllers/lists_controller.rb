class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "List successfully create"
      redirect_to lists_path
    else
      flash[:error] = "Could not be created"
      redirect_to new_list_path
    end
  end

  def new
    @list = List.new
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
