class AdminsController < ApplicationController
  
  before_filter :require_admin, only: [:show, :edit]
  before_filter :require_superadmin, only: [:create, :list, :destroy]

  def require_admin
    unless session[:admin_id] && session[:role_id] == 2
      flash[:error] = "You must be logged in AS ADMIN to access this section"
      redirect_to "/log_in"
    end
  end

  def require_superadmin
    unless session[:admin_id] && session[:role_id] == 1
      flash[:error] = "You must be logged in AS SUPERADMIN to access this section"
      redirect_to "/log_in"
    end
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    binding.pry
      if @admin.save
        session[:admin_id]=@admin.id
        redirect_to '/users_list'
      else
        render "new"
      end
  end
  
  def list
    @admin = Admin.all
  end

  def show
    @admin = Admin.find_by_id(session[:admin_id])
  end

  def edit
    @admin = Admin.find_by_id(session[:admin_id])
  end

  def update
    @admin = Admin.find_by_id(session[:admin_id])
    if @admin.update_attributes(params[:admin])
      flash[:success] = "Profile updated"
      redirect_to '/admin_show'
    else
      render 'edit'
    end
  end

  def destroy
    binding.pry
    if session[:admin_id] && session[:role_id] == 1
      admin = Admin.find_by_id(params[:id])
      if admin.id == session[:admin_id]
        flash[:error] = "You're too young to kill yourself"
        redirect_to '/users_list' and return
      else
        admin.destroy
        redirect_to '/users_list'
      end
    else
      flash[:error] = "Not allowed!!!"
      redirect_to '/user_show'
    end
  end

end
