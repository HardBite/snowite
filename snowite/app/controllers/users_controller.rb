class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/user_show'
    else
      render "new"
    end
  end
  
  def show
    @user = User.find_by_id(session[:user_id])
  end

  def edit
    @user = User.find_by_id(session[:user_id])
  end

  def update
    @user = User.find_by_id(session[:user_id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to '/user_show'
    else
      render 'edit'
    end
  end


end
