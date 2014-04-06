class ChallengesController < ApplicationController
  before_action :require_login
  
  def show
    @user = current_user([:actions])
    @challenge = Challenge.includes([:steps]).find(params[:id])
    @activities = current_user.activities.where(challenge: @challenge)
    @next_steps = @challenge.steps # fix this
  end
end
