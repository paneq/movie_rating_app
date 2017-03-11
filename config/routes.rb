Rails.application.routes.draw do
  get 'sessions/new'
  get 'profile', to: 'users#show'
  get 'profile/edit', to: 'users#edit'
  resources :activities
  devise_for :users
  post 'movies' => 'create_movie#create'
  resources :movies, except: [:create] do
  	resources :reviews, except: [:destroy]
  end
  resources :categories do
    resources :movies, only: [:index], controller: 'categories_movies'
  end
  root "movies#index"
end
