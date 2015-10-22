Rails.application.routes.draw do
  root to: 'reviews#index'

  get 'ui(/:action)', controller: 'ui'
  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :businesses, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :create]
  end

  resources :users, only: [:create]
end
