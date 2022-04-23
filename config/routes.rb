Rails.application.routes.draw do
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "routes#home"
  get '/tweet/:id', to: 'tweets#show'

  post 'tweets', to: 'tweets#create'
end
