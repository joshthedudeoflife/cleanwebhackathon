class UsersController < ApplicationController

	def new
		@user = User.new
	end
	
	def create
		if @user = User.create(user_params)
			set_user(@user)
			redirect_to root_url
		else
			render "new"
		end
	end
	
	private
	
  def user_params
    params.require(:user).permit(:username)
  end
end
