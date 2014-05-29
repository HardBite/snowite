class UsersController < ApplicationController

 # before_filter :require_login, only: [:show, :edit, :destroy]
 # before_filter :require_admin, only: [:index, :destroy]

  def require_admin
    unless session[:admin_id] && session[:role_id]<3
      flash[:error] = "You must be logged in AS ADMIN to access this section"
      redirect_to "/log_in"
    end
  end

  def require_login
    unless session[:user_id] || session[:admin_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/log_in"
    end
  end

  def usermodal
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.role_id = 3
      if @user.save
        session[:user_id] = @user.id
        session[:role_id] = @user.role_id
        redirect_to user_path(:id)
      else
        render "new"
      end
  end
  
  def index
    @users = User.order(sort_column + " " + sort_direction).page(params[:page]).per(5)
  end

  def show
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    elsif session[:admin_id]
      @user = Admin.find_by_id(session[:admin_id])
    else
      @user = User.find_by_email(params[:id])
      unless @user
        @user = Admin.find_by_email(params[:id])
      end
    end
  end

  def edit
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    elsif session[:admin_id]
      @user = Admin.find_by_id(session[:admin_id])
    end
  end

  def update
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated"
        redirect_to user_path(:id)
      else
        render 'edit'
      end
    elsif  session[:admin_id]
      @user = Admin.find_by_id(session[:admin_id])
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated"
        redirect_to admin_path(:id)
      else 
        render 'edit'
      end
    end
  end

  def destroy
      User.find_by_id(params[:id]).destroy
      redirect_to users_path
  end

end
