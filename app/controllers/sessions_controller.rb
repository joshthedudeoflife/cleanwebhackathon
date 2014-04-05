class SessionsController < ApplicationController
  def new
  	@user = User.new
  end
  
  def create
	  @user = User.find_by_username(params[:username])
	  
	  if @user
	    set_user(@user)	    
	    redirect_to root_url, :notice => "Logged in!"
	  else	    
	    render "new"
	  end
  end
  
  def destroy
  	set_user(nil)
	  redirect_to root_url, :notice => "Logged out!"
  end
  
end
