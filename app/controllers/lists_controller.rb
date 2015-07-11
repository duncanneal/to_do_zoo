class ListsController < ApplicationController
  def index
    @user = current_user.name
  end

  private

  def link_params
    params.require(:lists).permit(:name, :user_id)
  end

end