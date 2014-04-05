class SessionsController < ApplicationController
  def new
  	@user = User.new
  end
  
  def create
	  if @user = User.find_by_username(params[:user][:username])
	    set_user(@user)	    
	    redirect_to root_url, :notice => "Logged in!"
	  else	 
	    @user = User.new
	    render "new"
	  end
  end
  
  def destroy
  	set_user(nil)
	  redirect_to root_url, :notice => "Logged out!"
  end
  
  private
  
  	
  def user_params
    params.require(:user).permit(:username)
  end
  
end
