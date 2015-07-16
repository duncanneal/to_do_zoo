class KidsController < ApplicationController
  
  def index
    @kids = Kid.all
  end

  def new
    @kids = Kid.all
    @kid  = Kid.new
  end

  def create
    @kid  = Kid.new(kid_params)

    respond_to do |format|
      if @kid.save
        format.html { redirect_to new_kid_path, notice: 'Your Bundle of joy was added successfully' }
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