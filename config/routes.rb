Rails.application.routes.draw do
  get 'sessions/new'
  resources :activities
  devise_for :users
  resources :movies do
    resources :reviews, except: [:destroy]
  end
  resources :categories do
    resources :movies, only: [:index], controller: 'categories_movies'
  end
  root "movies#index"
end
