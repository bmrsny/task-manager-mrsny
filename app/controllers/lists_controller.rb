class ListsController < ApplicationController
  def index
    @lists = List.not_archived
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

  def show
    @list = List.find(params[:id])
  end

  def edit
   @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:success] = "List updated"
      redirect_to lists_path
    else
      flash[:error] = "Could not update"
      redirect_to edit_list_path(@list)
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
