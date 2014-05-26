class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :sort_column, :sort_direction

private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    elsif session[:admin_id]
      @current_user ||= Admin.find(session[:admin_id])
    end 
  end

  def sort_column
    params[:sort] || "fname"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end

end
