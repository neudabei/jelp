Rails.application.routes.draw do
  root to: 'reviews#index'

  get 'ui(/:action)', controller: 'ui'
  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :businesses, only: [:show, :new, :create] do
    resources :reviews, only: [:index, :create]
    collection do
      get :search, to: "businesses#search"
    end
  end

  resources :users, only: [:create, :show]
  resources :categories, only: [:index, :show]
end
