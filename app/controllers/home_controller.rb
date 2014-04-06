class HomeController < ApplicationController
  before_action :require_login
  
	def index
    @user = current_user([:challenges, :activites])
    @challenges = Challenge.all.order(end_date: :asc)
    @activities = @user.activities
  end
  
end
