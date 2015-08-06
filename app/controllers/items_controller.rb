class ItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_list

  def index
    @items = @list.items.all
    @item  = @list.items.new
  end

  def new
  end

  def create
    @item = @list.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to list_items_path(@list), notice: 'You added a new Step, Great job!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    redirect_to kid_path(@list.kid), notice: 'Great Job!'
  end

  def destroy
    @item = Item.find(params[:id])
    

    @item.destroy
    respond_to do |format|
      format.html { redirect_to list_items_url(@list), notice: 'Item Removed.' }
    end

 #   if @item.destroy
 #     format.html { redirect_to list_items_path(@list), notice: "You have successfully removed this item." }
 #   else
 #     format.html { redirect_to list_items_path(@list), notice: "Item could not be deleted." }
 #   end
    #redirect_to @todo_list   
  end  

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:task, :list_id, :due_date, :is_complete, :item_image)
  end

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end
end