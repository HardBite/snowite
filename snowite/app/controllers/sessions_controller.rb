class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.new.login(params[:session][:email], params[:session][:password])
    if user
      session[:user_id] = user.id
      redirect_to '/user_show' 
    else
      flash[:notice => "invalid"]
      render "new"
    end
  end

  def destroy
   session[:user_id] = nil
   redirect_to "/log_in"
  end

end
