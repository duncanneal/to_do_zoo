class KidsController < ApplicationController

  def index
    @kids = current_user.kids.all
    @kid = current_user.kids.new
  end

  def show
    @kid = current_user.kids.find(params[:id])
    @lists = current_user.lists.all
    @item = Item.all
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

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    redirect_to root_path, notice: 'Task was successfully updated.'
  end

  private

  def kid_params
    params.require(:kid).permit(:name, :kidimg)
  end
end