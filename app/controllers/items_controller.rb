class ItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_list

  def index
    @items = @list.items.all
    @item = @list.items.new
  end

  def new
  end

  def create
    @item = @list.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to list_items_path(@list), notice: 'You added a new Item, Great job!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    redirect_to kids_path, notice: 'Great Job!'
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:task, :list_id, :due_date, :is_complete)
  end

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end
end