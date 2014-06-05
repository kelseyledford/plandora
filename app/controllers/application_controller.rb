class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_groups

  private

  def set_groups
  	@groups = Group.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end