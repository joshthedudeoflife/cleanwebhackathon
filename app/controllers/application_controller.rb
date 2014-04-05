class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protect_from_forgery
	helper_method :current_user
	helper_method :set_user
	  
  private  
  
  # returns the logged in user
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
	# sets (or unsets) the user cookie
	def set_user(user)
		if user.is_a? User
			session[:user_id] = user.id
		else
			session[:user_id] = nil
		end
	end
	
end
