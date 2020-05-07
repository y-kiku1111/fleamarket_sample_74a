Rails.application.routes.draw do
  # get 'items/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :users
  root to: "products#index"
  # root to: "products#show"
  resources :products
  resources :users
end
