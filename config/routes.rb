Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :users, only: :show
  resources :products
  resources :users
  resources :likes, only: [:edit, :update]

  resources :products do
    resources :comments, only: [:create]
  end

end
