class CreateReviewService

  def call(movie_id, attributes, user)
    review = user.reviews.build(attributes)
    movie = Movie.find(movie_id)
    review.movie = movie
    if attributes[:rating].blank?
      review.rating = 0
    end
    review.save
    return review
  end

  private
    def find_movie(attributes)
      Movie.find(attributes[:id])
    end
end