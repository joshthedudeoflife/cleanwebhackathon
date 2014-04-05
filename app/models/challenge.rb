class Challenge < ActiveRecord::Base
  # relations
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :steps, dependent: :destroy
  has_many :activities, dependent: :destroy
  
  # validations
  validates :title, :description, :start_date, :end_date, presence: true
end
