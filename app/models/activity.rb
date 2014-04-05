class Activity < ActiveRecord::Base
  # relations
  belongs_to :action, polymorphic: true, dependent: :destroy
  belongs_to :challenge
  belongs_to :user
  
  # validations
  validates :action, :user, :competition, presence: true
  
end
