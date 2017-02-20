Rails.application.routes.draw do
  devise_for :users
  resources :movies do
  	resources :reviews
  end
  resources :categories do
    resources :movies, only: [:index], controller: 'categories_movies'
  end
  root "movies#index"
end
