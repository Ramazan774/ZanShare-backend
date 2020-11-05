Rails.application.routes.draw do

  resources :listings
  resources :products
  resources :users

  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
end
