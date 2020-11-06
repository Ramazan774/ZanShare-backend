Rails.application.routes.draw do

  resources :listings
  resources :products
  resources :users
  resources :user_listings

  post '/users/login', to: 'users#login'
  get '/current_session', to: 'user#current_session'
end
