Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:index, :new, :create]
  resources :users, only: [:show, :destroy]
  resources :cards, only: :new
  resources :products
  resources :users

  resources :products do
    resources :comments, only: [:index, :create]
  end

end
