class ListsController < ApplicationController
  before_action :find_list, only: %i[show destroy]

  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  def show; end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
