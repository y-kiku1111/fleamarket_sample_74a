Rails.application.routes.draw do
 
  # devise_for :users

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end


  
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

