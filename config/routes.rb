Rails.application.routes.draw do
  root to: "sessions#pcspace"

  get '/register', to: 'sessions#register'
  post '/register', to: 'sessions#create'

  # login routes
  get '/login', to: "sessions#login"
  post '/login', to: "sessions#new"
  
  # logout routes
  delete '/signout', to: "sessions#signout"

  get '/auth/:provider/callback', to: "sessions#omni"
  

  resources :genres, only: [:show, :edit]
  resources :comments, only: [:show, :edit]
  resources :resourzes
  resources :users, only: [:show]
  resources :games, only: [:show, :index, :new, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
