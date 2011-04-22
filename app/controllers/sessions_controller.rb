class SessionsController < ApplicationController
  before_filter :auth_login, :only => [:show]
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      redirect_to queries_path
    else
      flash[:error] = "Invalid Email or Password"
      redirect_to root_path
    end
  end
  
  def show
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged Out!"
  end

end
