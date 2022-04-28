Rails.application.routes.draw do
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "routes#home"
  get '/tweet/:id', to: 'tweets#show'
  get '/profile', to: 'routes#profile'
  post '/tweets', to: 'tweets#create'
  post '/like', to: 'likes#create'
  get '/like/:id', to: 'likes#destroy'
end
