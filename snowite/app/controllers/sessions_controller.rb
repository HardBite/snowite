class SessionsController < ApplicationController
  def new
  end

  def create
      admin = Admin.new.login(params[:session][:email],
                              params[:session][:password])
      if admin
        session[:user_id] = nil
        session[:admin_id] = admin.id
        session[:role_id] = admin.role_id
        redirect_to '/users_list'
      elsif
        user = User.new.login(params[:session][:email],
                              params[:session][:password])
        if user
          session[:admin_id] = nil
          session[:user_id] = user.id
          session[:role_id] = user.role_id
          redirect_to '/user_show' 
        end
      
      else
        flash[:notice => "invalid"]
        render "new"
    end
 #binding.pry
  end


  def destroy
   session[:user_id] = nil
   session[:admin_id] = nil
   redirect_to "/log_in"
  end

end
