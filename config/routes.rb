Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rented_products, only: [:show]
      resources :products
      resources :users
    end
  end
end
