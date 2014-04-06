class PledgesController < ApplicationController
  before_action :require_login
  
  def create
  
    success = false
    ActiveRecord::Base.transaction do
      # create action      
      if action = Actions::PledgeAction.create(step_id: params[:step_id], user_id: session[:user_id])
        success = log_activity(params[:challenge_id], action)
      end
    end
    
    if success
      render json: true
    else
      render json: false
    end
  end
end
