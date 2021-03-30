Rails.application.routes.draw do
  # get '/' => 'sessions"pcspace'

  get '/register' => 'users#new'
  post '/register' => 'users#create'

  # login routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  # logout routes
  delete '/signout' => 'sessions#destroy'
  

  resources :genres
  resources :comments
  resources :users
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
