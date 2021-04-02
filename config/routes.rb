Rails.application.routes.draw do
  root to: "sessions#pcspace"

  get '/register', to: 'sessions#register'
  post '/register', to: 'sessions#create'

  # login routes
  get '/login', to: "sessions#login"
  post '/login', to: "sessions#new"
  
  # logout routes
  delete '/signout', to: "sessions#destroy"

  get '/auth/:provider/callback', to: "sessions#omni"
  
  resources :comments
  # resources :resourzes
  resources :users do
    resources :game, only: [:new, :create, :index]
  end
  resources :games do
    resources :comments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
