Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: "products#index"
  resources :cards, only: :new

  resources :users, only: [:show, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :likes, only: [:create, :destroy]
  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
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

