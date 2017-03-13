class CreateMovieService
  def call(movie_attributes, user)
    @movie = user.movies.new(movie_attributes)
  end
end