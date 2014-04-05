class Step < ActiveRecord::Base
  # relations
  belongs_to :challenge
  has_many :pledges, class_name: "Actions::PledgeAction"

  # validations
  validates :title, :description, :pledge_points, :pledge_description, presence: true
end
