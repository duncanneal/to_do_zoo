class ListsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    
  end

  def list
    
  end

  def item
    
  end

  def progress
    
  end

  private

  def link_params
    params.require(:lists).permit(:name, :user_id)
  end

end