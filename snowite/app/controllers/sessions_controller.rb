class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    if params[:session][:admincheck] == "true"
      admin = Admin.new.login(params[:session][:email], params[:session][:password])
      if admin
        session[:user_id] = nil
        session[:admin_id] = admin.id
        redirect_to '/users_list'
      else
        flash[:notice => "invalid"]
        render "new"
      end
    else
      user = User.new.login(params[:session][:email], params[:session][:password])
      if user
        session[:admin_id] = nil
        session[:user_id] = user.id
        redirect_to '/user_show' 
      else
        flash[:notice => "invalid"]
        render "new"
      end
  end
  end


  def destroy
   session[:user_id] = nil
   session[:admin_id] = nil
   redirect_to "/log_in"
  end

end
