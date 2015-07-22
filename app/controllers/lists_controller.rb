class ListsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @lists = current_user.lists.all
    @list  = current_user.lists.new
  end

  def new
  end

  def create
    @list = current_user.lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_path, notice: 'You added a new List, Great job!' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :kid_id)
  end
end
