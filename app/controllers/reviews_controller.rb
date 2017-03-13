class ReviewsController < ApplicationController
  before_action :find_movie
  before_action :find_review, only: [:edit, :update]
  before_action :authenticate_user!, only: [:new, :edit]
   
  def new
    @review = Review.new
  end

  def create
    if CreateReviewService.new.call(review_params, current_user)
      @review.create_activity :create, owner: current_user
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end
 
  def edit
  end
 
  def update
    if @review.update(review_params)
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end
 
  private
    def review_params
      params.require(:review).permit(:rating, :comment)   
    end
 
    def find_movie
      @movie = Movie.find(params[:movie_id])
    end
 
    def find_review
      @review = current_user.reviews.find(params[:id]) || render_404
    end
 
    def render_404
      rescue ActiveRecord::RecordNotFound
    end
end 