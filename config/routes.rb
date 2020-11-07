Rails.application.routes.draw do

  resources :users
  resources :products
  resources :listings

  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
end
