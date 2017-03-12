class MoviesController < ApplicationController
	before_action :find_movie, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		@movies = Movie.all.order("created_at DESC")
	end

	def show
		if @movie.reviews.blank?
			@average_review = 0
		else
			@average_review = @movie.reviews.average(:rating).round(2)
		end
	end

	def new
		@movie = current_user.movies.build
	end

	def edit
		@movie_categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@movie.category_id = params[:category_id]
		if @movie.update(movie_params)
			redirect_to movie_path(@movie)
		else
			render 'edit'
		end
	end

	def destroy
		@movie.destroy
		redirect_to root_path
	end

	private
		def movie_params
			params.require(:movie).permit(:title, :description,
						:movie_length, :director, :image, :category_id)
		end

		def find_movie
			@movie = Movie.find(params[:id])
		end
	end