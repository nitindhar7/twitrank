# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :current_user, :auth_login
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def auth_login
    unless current_user
      flash[:error] = "Please Login or Signup"
      redirect_to root_url
    end
  end
end
