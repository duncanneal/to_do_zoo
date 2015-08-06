class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    current_user = User.find_by_id(session[:user_id])
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end
end
