Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:index, :new, :create]
  resources :users, only: [:show, :destroy]
  resources :cards, only: :new

  # ↓多分いらない
  resources :products
  
  resources :users
  resources :likes, only: [:create, :destroy]

  resources :products do
    resources :comments, only: [:create]
    resources :cards do
      collection do
        post 'pay', to: 'cards#pay'
        post 'delete', to: 'card#delete'
        post 'show'
      end
      member do
        get 'confirmation'
      end
    end
  end

  resources :users, only: [:index, :show] do
    resources :cards,  only: [:index, :destroy]do
      collection do
        post 'delete', to: 'card#delete'
      end
    end
  end

end
