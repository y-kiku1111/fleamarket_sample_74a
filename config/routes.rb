Rails.application.routes.draw do

  root to: "products#index"
  resources :users, only: [:show, :destroy]
  resources :products, only: [:new]
  resources :cards, only: :new

end
