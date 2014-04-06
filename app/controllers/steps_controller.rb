class StepsController < ApplicationController
  before_action :require_login
  
  def show
    @user = current_user
    @challenge = Challenge.includes(:steps).find(params[:challenge_id])
    @step = @challenge.steps.find(params[:id])
    @completed = Actions::PledgeAction.where(step_id: @step.id, user_id: @user.id).present?
    render :show, layout: false
  end
end
