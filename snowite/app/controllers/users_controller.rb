class UsersController < ApplicationController
  before_filter :require_login, only: [:list, :show, :edit, :destroy]
  before_filter :require_admin, only: [:list, :destroy]

  def require_admin
    unless session[:admin_id]
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



  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if params[:user][:admincheck]
      @admin = Admin.new(params[:user])
      if @admin.save
        session[:admin_id]=@admin.id
        redirect_to '/users_list'
      end
    else
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/user_show'
      else
        render "new"
      end
    end
  end
  
  def list
    @user = User.all
  end

  def show
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    else
      binding.pry
      @user = User.find_by_email(params[:id])
    end
  end

  def edit
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    else
      @user = Admin.find_by_id(session[:admin_id])
    end
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

  def destroy
    if session[:admin_id]
      binding.pry
      User.find_by_id(params[:id]).destroy
      redirect_to '/users_list'
    else
      flash[:error] = "Not allowed!!!"
      redirect_to '/user_show'

    end
  end

end
