class ChallengesController < ApplicationController
  before_action :require_login
  
  def show
    @user = current_user([:actions])
    @challenge = Challenge.includes([:steps]).find(params[:id])
    @activities = current_user.activities.where(challenge: @challenge)
  end
end
