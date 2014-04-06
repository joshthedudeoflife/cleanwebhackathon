class Actions::DataAction < ActiveRecord::Base
  # relations
  belongs_to :user
  has_one :activity, :as => :action
    
  # validations
  validates :user, :value, presence: true
  
  def points    
    value > 0 ? value : 0
  end
  
  def summary
    "Saved #{value.round}% this week."
  end
end
