Rails.application.routes.draw do
  root 'users#show'
  resources :users
  resources :suppliers
  resources :roles
  resources :reports
  resources :orders
  resources :order_items
  resources :locations
  resources :inventory_transactions
  resources :categories
  resources :products

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
