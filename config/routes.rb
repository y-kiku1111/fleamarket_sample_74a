Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :users, only: [:show, :destroy]
  resources :cards, only: :new

  resources :products, only: [:index, :show, :new, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :comments, only: [:index, :create]
  end

end