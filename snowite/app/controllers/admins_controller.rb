class AdminsController < ApplicationController
  
  before_filter :require_admin, only: [:show, :edit]
  before_filter :require_superadmin, only: [:create, :index, :destroy]

  def require_admin
    unless session[:admin_id] && session[:role_id] <3
      flash[:error] = "You must be logged in AS ADMIN to access this section"
      redirect_to "/log_in"
    end
  end

  def require_superadmin
    unless session[:admin_id] && session[:role_id]  <2
      flash[:error] = "You must be logged in AS SUPERADMIN to access this section"
      redirect_to "/log_in"
    end
  end

  def new
    @admin = Admin.new
  end

  def create
    binding.pry
    @admin = Admin.new(params[:admin])
      if @admin.save
        flash[:success] = "Admin #{@admin.email} created"
        redirect_to admins_path
      else
        redirect_to '/log_in'
      end
  end
  
  def index
     @admins = Admin.order(sort_column + " " + sort_direction).page(params[:page]).per(5)
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
      redirect_to admin_path(:id)
    else
      render 'edit'
    end
  end

  def destroy
    if session[:admin_id] && session[:role_id] == 1
      admin = Admin.find_by_id(params[:id])
      if admin.id == session[:admin_id]
        flash[:error] = "You're too young to kill yourself"
        redirect_to admins_path and return
      else
        admin.destroy
        redirect_to admins_path
      end
    else
      flash[:error] = "Not allowed!!!"
      redirect_to '/log_in'
    end
  end

end
