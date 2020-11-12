Rails.application.routes.draw do

  resources :users
  resources :products

  post '/users/login', to: 'users#login'
  get '/current_session', to: 'users#current_session'
end
