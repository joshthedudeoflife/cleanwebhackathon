class Actions::DataAction < ActiveRecord::Base
  # relations
  belongs_to :user
  has_one :activity, :as => :action
    
  # validations
  validates :user, :value, presence: true
  
  def points    
    value > 0 ? value * 10 : 0
  end
  
  def summary
    if value < 0
      "Used #{value.round}% more electricity this week than last week."
    else
      "Used #{value.round}% less electricity than last week."
    end
    
  end
end
