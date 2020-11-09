Rails.application.routes.draw do

  resources :users
  resources :products
  resources :listings

  post '/users/login', to: 'users#login'
  get '/current_session', to: 'users#current_session'
end
