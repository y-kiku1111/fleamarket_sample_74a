Rails.application.routes.draw do

  root to: "products#index"
  resources :users, only: :show
  resources :products, only: [:new]


end
