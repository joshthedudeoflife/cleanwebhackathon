class ChallengesController < ApplicationController
  before_action :require_login
  
  def show
    @user = current_user([:actions])
    @challenge = Challenge.includes([:steps]).find(params[:id])
    @is_member = @user.memberships.where(challenge_id: @challenge.id).present?
    @activities = current_user.activities.where(challenge: @challenge).order(created_at: :desc)
    @next_steps = @challenge.steps # fix this later
  end
end
