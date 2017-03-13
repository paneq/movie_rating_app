# class CreateReviewController < ApplicationController
#   before_action :find_movie
#   def create
#     @review = current_user.reviews.build(review_params)
#     @review.movie_id = @movie.id
#     if params[:review][:rating].blank?
#       @review.rating = 0
#     end

#     if @review.save
#       @review.create_activity :create, owner: current_user
#       redirect_to movie_path(@movie)
#     else
#       render 'new'
#     end
#   end

#   private
#     def review_params
#       params.require(:review).permit(:rating, :comment)   
#     end

#     def find_movie
#       @movie = Movie.find(params[:movie_id])
#     end
# end