class CategoriesMoviesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @movies = Movie.where(category_id: @category.id).order("created_at DESC")
  end
end