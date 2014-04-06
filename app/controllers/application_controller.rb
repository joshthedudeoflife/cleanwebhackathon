class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception  
	helper_method :current_user
	helper_method :set_user
	  
  private
 
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
  
  # returns the logged in user
  def current_user(include_fields=[])
  	@current_user ||= User.includes(include_fields).find(session[:user_id]) if session[:user_id]
	end
	
	# sets (or unsets) the user cookie
	def set_user(user)
		if user.is_a? User
			session[:user_id] = user.id
		else
			session[:user_id] = nil
		end
	end
	
	def log_activity(challenge_id, action)
	  Activity.create(user_id: session[:user_id], challenge_id: challenge_id, action: action, points: action.points)
	end
	
end
