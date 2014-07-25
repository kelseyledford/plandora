class ApplicationController < ActionController::Base
  protect_from_forgery
	
	before_action :set_groups

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def set_groups
  	@groups = Group.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound 
  end
  helper_method :current_user

end