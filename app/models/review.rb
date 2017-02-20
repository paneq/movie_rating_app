class Review < ApplicationRecord
	belongs_to :movie
	belongs_to :user

	validates :comment, presence: true
  validates :rating, :inclusion => 1..10
end
