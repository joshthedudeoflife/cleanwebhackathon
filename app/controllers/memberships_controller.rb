class MembershipsController < ApplicationController
  before_action :require_login
  
  def create
    user = current_user
    challenge = Challenge.find(params[:challenge_id])    
    if user.memberships.create(challenge: challenge)    
      render json: true
    else
      render json: false
    end
  end
end
