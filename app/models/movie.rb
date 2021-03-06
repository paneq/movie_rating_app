class Movie < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  belongs_to :user
  belongs_to :category
  has_many   :reviews, dependent: :destroy
  
  validates :title, length: { maximum: 45,
             too_long: "%{count} characters is the maximum allowed" }, presence: true
  validates :description, length: { maximum: 200,
             too_long: "%{count} characters is the maximum allowed" }, presence: true
  validates :director, length: { maximum: 50,
             too_long: "%{count} characters is the maximum allowed" }, presence: true
  validates :movie_length, length: { maximum: 250,
             too_long: "%{count} is the maximum allowed" }, presence: true
  
  validates_numericality_of :movie_length, greater_than_or_equal_to: 0
  has_attached_file :image, styles: { medium: "250x350#", large: "325x475#" }
  validates :image, attachment_presence: true
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
