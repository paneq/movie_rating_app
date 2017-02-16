class Movie < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many   :reviews
	
	validates :title, length: { maximum: 45,
    				 too_long: "%{count} characters is the maximum allowed" }, presence: true
	validates :description, length: { maximum: 200,
						 too_long: "%{count} characters is the maximum allowed" }, presence: true
	validates :director, length: { maximum: 50,
    				 too_long: "%{count} characters is the maximum allowed" }, presence: true
	validates :movie_length, length: { maximum: 300,
    				 too_long: "%{count} is the maximum allowed" }, presence: true
	validates :image_url, presence: true
	validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "Image must be in .png, .jpg or .jpeg format", 
											:multiline => true
	validates_numericality_of :movie_length, greater_than_or_equal_to: 0

end
