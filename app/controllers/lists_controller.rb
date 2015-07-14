class ListsController < ApplicationController
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end
  
  def new
    render :new
  end

  def update
    @list= List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def index
  @lists = List.all
end

def show
  @list = List.find(params[:id])
end

def new
  @list = List.new
end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to  lists_path
    else
      render :new
    end
  end
end

  private
  def list_params
    params.require(:list).permit(:name, :description)
  end
