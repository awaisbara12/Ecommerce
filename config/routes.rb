Rails.application.routes.draw do

  namespace :admin do
    get 'admin_home/home'
  end
  resources :orders
  resources :carts
  resources :products
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  resources :products do
    member do
      match ':controller(/:action(/:id))', :via => [:get, :post]  
    end
  end

  resources :categories

  devise_for :users
  root to: "categories#index"


  
  namespace :admin do
    resources :categories
    
    resources :users
    resources :products
    resources :carts 
  end

  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
