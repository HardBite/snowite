class SessionsController < ApplicationController
  def new
  end

  def create
    #binding.pry
    user = User.new.login(params[:session][:email], params[:session][:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:notice => "invalid"]
      render "new"
    end
  end

  def destroy
   session[:user_id] = nil
  end

end
