class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by_unique1(session[:user_unique1]) if session[:user_unique1]
  end
  helper_method :current_user
end
