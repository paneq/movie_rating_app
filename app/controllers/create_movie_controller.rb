class CreateMovieController < ApplicationController
  def create
    @movie = current_user.movies.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render 'movies/new'
    end
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :description,
            :movie_length, :director, :image, :category_id)
    end
end