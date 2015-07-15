class ItemsController < ApplicationController

 def index
  @items = Item.all
  @item = Item.new
end

def new

end

def create
  @item = Item.new(item_params)

  respond_to do |format|
    if @item.save
      format.html { redirect_to items_path, notice: 'You added a new Item, Great job!' }
    else
      format.html { render :new }
    end
  end
end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:task, :list_id, :due_date, :is_complete)
  end

end