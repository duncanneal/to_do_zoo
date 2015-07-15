class ListsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @lists = List.all
    @list = List.new
  end

  def progress

  end

  def new

  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_path, notice: 'You added a new List, Great job!' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
