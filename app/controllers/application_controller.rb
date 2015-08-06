class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :resource, :resource_name, :devise_mapping

  before_filter :set_kids

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  #This was added to overide default routing upon successful login
  def after_sign_in_path_for(resource)
    kids_path
  end

  def set_kids
    @kids = Kid.all
  end

  #Commented this out bc wasn't sure it was having any effect. This was pasted in with top 2 methods when setting up login modal on home page
  #def devise_mapping
   # @devise_mapping ||= Devise.mappings[:user]
  #end
end
