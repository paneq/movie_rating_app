class Review < ApplicationRecord
	belongs_to :movie
	belongs_to :user

	validates :comment, presence: true
  validates :rating, presence: true, length: { minimum: 0, maximum: 10 }
end
