class CreateReviewService < ApplicationController
  before_action :find_movie

  def call(review_attributes, user)
    @review = user.reviews.build(review_attributes)
    @review.movie_id = @movie.id
    if params[:review][:rating].blank?
      @review.rating = 0
    end
  end

  private
    def find_movie
      @movie = Movie.find(params[:id])
    end

end