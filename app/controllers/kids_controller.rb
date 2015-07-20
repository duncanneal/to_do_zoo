class KidsController < ApplicationController

  def index
    @kids = current_user.kids.all
    @kid = current_user.kids.new
  end

  def show
    @kid = current_user.kids.find(params[:id])
    @lists = @kid.lists.all

    if params[:list]
      @list = current_user.lists.find(params[:list])
    else
      @list = current_user.lists.first
    end

    @items = @list.items
    render :layout => false
  end

  def create
    @kid = current_user.kids.new(kid_params)

    respond_to do |format|
      if @kid.save
        format.html { redirect_to kids_path, notice: 'Your Bundle of joy was added successfully' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def kid_params
    params.require(:kid).permit(:name, :kidimg)
  end
end