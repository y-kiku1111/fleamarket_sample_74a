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
      get 'get_edit_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :comments, only: [:create]
    resources :cards, only: [:index, :create, :new] do
      collection do
        post 'pay', to: 'cards#pay'
        get 'show'
      end
    end
  end

  resources :users, only: [:index, :show] do
    resources :cards,  only: [:index]do
      collection do
        post 'delete1', to: 'cards#delete1'
        post 'delete2', to: 'cards#delete2'
        post 'delete3', to: 'cards#delete3' 
        get 'new1', to: 'cards#new1'
        post 'create1', to: 'cards#create1'  
      end
    end
  end

end

