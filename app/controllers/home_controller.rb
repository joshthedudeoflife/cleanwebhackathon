class HomeController < ApplicationController
  before_action :require_login
  
	def index
    @user = current_user([:challenges, :activites])
    @challenges = Challenge.all
    @activities = @user.activities
  end
  
end
