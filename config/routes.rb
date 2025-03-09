Rails.application.routes.draw do


  namespace :chef do
    get 'dashboard/index'
  end
  require 'sidekiq/web'
  Rails.application.routes.draw do
  namespace :chef do
    get 'dashboard/index'
  end
    mount Sidekiq::Web => '/sidekiq'
  end

  namespace :admin do
    get 'admin_home/home'
  end
  resources :orders
  resources :create_activations, only: :create
  resources :carts
  resources :products
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  post 'user/products/add_to_cart/:id', to: 'user/products#add_to_cart', as: 'user_add_to_cart'
  post 'admin/products/add_to_cart/:id', to: 'admin/products#add_to_cart', as: 'admin_add_to_cart'
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
    resources :orders do
      get :order_products, on: :collection
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :categories
      end
    end
  end

  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
