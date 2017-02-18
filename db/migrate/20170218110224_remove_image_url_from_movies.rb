class RemoveImageUrlFromMovies < ActiveRecord::Migration[5.0]
  def change
  	remove_column :movies, :image_url, :string
  end
end
