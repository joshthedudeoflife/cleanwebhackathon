class Actions::PledgeAction < ActiveRecord::Base
  # relations
  belongs_to :user
  belongs_to :step
  has_one :activity, :as => :action

  # validations
  validates :step, :user, presence: true
  
  def points
    return step.pledge_points
  end
  
  def summary
    return "+#{points}: #{step.pledge_description}"
  end
end
