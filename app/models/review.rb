class Review < ApplicationRecord
	belongs_to :movie
	belongs_to :user

	validates :rating, length: { maximum: 100,
    				 too_long: "%{count} characters is the maximum allowed" }, presence: true
	validates :comment, presence: true
end
