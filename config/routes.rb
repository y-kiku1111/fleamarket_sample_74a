Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:index, :new, :create]
  resources :users, only: [:show, :destroy]
  resources :cards, only: :new
  resources :products
  
  resources :users
  resources :likes, only: [:create, :destroy]
  resources :products do
    resources :comments, only: [:create]
  end

end
