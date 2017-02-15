class Movie < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many   :reviews
	
	validates  :title, :description, :director, 
			   :movie_length, :image_url, presence: true
end
