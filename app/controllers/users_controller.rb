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
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to queries_path, :notice => "Signed Up!"
    else
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to queries_path, :notice => "Account Updated!"
    else
      flash[:error] = "Update Failed!"
      redirect_to queries_path
    end
  end

end
