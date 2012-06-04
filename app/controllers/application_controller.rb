class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :instructor?

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  private
  
  def instructor?
  	user = User.find(session[:user_id]) if session[:user_id]
  	unless user.instructor
  		return false
  	else
  		return true
  	end
  end
end
