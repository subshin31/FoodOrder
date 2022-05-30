Rails.application.routes.draw do
  resources :restaurants
  resources :cuisines
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "restaurants#index"
end
