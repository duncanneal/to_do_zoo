class KidsController < ApplicationController
  
  def index

  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(list_params)

    respond_to do |format|
      if @kid.save
        format.html { redirect_to root_path, notice: 'Your Bundle of joy was added successfully' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def list_params
    params.require(:kid)
  end

end