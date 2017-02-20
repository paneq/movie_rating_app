class Review < ApplicationRecord
	belongs_to :movie
	belongs_to :user

	validates :comment, presence: true
  validates_length_of :rating, in: 0..10, allow_blank: true
end
