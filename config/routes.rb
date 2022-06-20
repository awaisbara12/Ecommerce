Rails.application.routes.draw do

  namespace :admin do
    get 'admin_home/home'
  end
  resources :orders
  resources :carts
  resources :products
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  post 'user/products/add_to_cart/:id', to: 'user/products#add_to_cart', as: 'user_add_to_cart'
  resources :products do
    member do
      match ':controller(/:action(/:id))', :via => [:get, :post]  
    end
  end

  resources :categories

  devise_for :users
  root to: "user/categories#index"


  
  namespace :admin do
    resources :categories
    resources :orders
    resources :users
    resources :products
    resources :carts 
  end

  namespace :user do
    resources :categories
    resources :products
    resources :carts 
    resources :orders
  end

  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
