Rails.application.routes.draw do
  resources :users
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get    '/signup',  to: 'users#new'
  get '/signin' => 'sessions#new', :as => :signin
  post '/signin'=> 'sessions#redirects'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
