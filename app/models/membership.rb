class Membership < ActiveRecord::Base
  # relations
  belongs_to :user
  belongs_to :challenge
  
  # validations
  validates :user, :challenge, presence: true
end
