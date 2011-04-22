require 'bcrypt'

class UsersController < ApplicationController
  layout "authentication"
  
  def welcome
  end
  
  def new
    @user = User.new
    
    respond_to do |format|
      format.js
    end
  end
  
  def create
    logger.info(params[:user])
    
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to queries_path, :notice => "Signed Up!"
    else
      render "new"
    end
  end

end
