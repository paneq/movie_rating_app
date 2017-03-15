class CreateMovieService
  def call(movie_attributes, user)
    movie = user.movies.create(movie_attributes)
  end
end