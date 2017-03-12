Rails.application.routes.draw do
  get 'sessions/new'
  resources :activities
  devise_for :users
  post 'movies' => 'create_movie#create'
  resources :movies, except: [:create] do
    post 'reviews' => 'create_review#create'
    resources :reviews, except: [:destroy, :create]
  end
  resources :categories do
    resources :movies, only: [:index], controller: 'categories_movies'
  end
  root "movies#index"
end
