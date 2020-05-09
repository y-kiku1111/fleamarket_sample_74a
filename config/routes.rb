Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :users, only: :show
  resources :products
  resources :users
  # resources :comments

  resources :products do
    resources :comments, only: [:index, :create]
  end

end
