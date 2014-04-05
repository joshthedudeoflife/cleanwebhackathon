class HomeController < ApplicationController
	def index
  	if @user = current_user
  		render "index"
  	else
  		redirect_to login_path
  	end
  end
end
