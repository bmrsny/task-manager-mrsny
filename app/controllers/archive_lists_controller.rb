class ArchiveListsController < ApplicationController

  def index
    @lists = List.where(archived: true)
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(archived: true)
      flash[:success] = "added to archive"
      redirect_to archive_lists_path
    else
      flash[:errors] = "could not archive at this time"
      redirect_to lists_path
    end
  end

  def destroy
    @list = List.find(params[:id]).delete
    redirect_to archive_lists_path
  end
end
