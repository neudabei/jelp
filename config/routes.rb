Rails.application.routes.draw do
  root to: 'businesses#index'

  get 'ui(/:action)', controller: 'ui'
  get 'register', to: 'users#new'

  resources :businesses, only: [:index, :new, :create]
  resources :users, only: [:create]
end
