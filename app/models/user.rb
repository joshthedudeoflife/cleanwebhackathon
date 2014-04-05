class User < ActiveRecord::Base
  # relations
  has_many :memberships, dependent: :destroy
  has_many :challenges, through: :memberships
  has_many :activities, dependent: :destroy
  
  # validations
  validates :username, uniqueness: true
  
  # methods
  def points
    activities.inject(0) {|r,i| r+= i.points}
  end
end
