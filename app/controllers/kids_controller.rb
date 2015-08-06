class KidsController < ApplicationController
before_filter :authenticate_user!

  def index
    @kids = current_user.kids.all
    @kid  = current_user.kids.new
  end

  def show
    @kid   = current_user.kids.find(params[:id])
    @lists = @kid.lists


    if params[:list]
      @list = current_user.lists.find(params[:list])
    else
      @list = @kid.lists.first
    end

    #puts params[:list]

    #@list.items.each do |item|
     # puts item.task
    #end
    unless @list.blank?
      @items = @list.items
    else
      @items == nil
    end
    
    render :layout => false
  end

  def create
    @kid = current_user.kids.new(kid_params)

    respond_to do |format|
      if @kid.save
        format.html { redirect_to kids_path, notice: "Great! If you're done adding kids, try adding a Task." }
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