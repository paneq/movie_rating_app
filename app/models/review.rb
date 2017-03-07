class Review < ApplicationRecord
  include PublicActivity::Common
  # tracked owner: ->(controller, model) { controller && controller.current_user }
  
  belongs_to :movie
  belongs_to :user

  validates :comment, presence: true
  validates :rating, :inclusion => 0..10
end
