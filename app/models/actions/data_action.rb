class Actions::DataAction < ActiveRecord::Base
  # relations
  belongs_to :user
  has_one :activity, :as => :action
    
  # validations
  validates :user, :value, presence: true
  
  def points
    value
  end
end
