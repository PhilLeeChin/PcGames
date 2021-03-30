Rails.application.routes.draw do
  root to: "sessions#pcspace"

  get '/register', to: "users#new"
  # post '/register' => 'users#create'

  # login routes
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  
  # logout routes
  get '/signout', to: "sessions#destroy"

  get '/auth/:provider/callback', to: "sessions#omniauth"
  

  resources :genres
  resources :comments
  resources :resourzes
  resources :users, only: [:show, :edit, :update, :create]
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
