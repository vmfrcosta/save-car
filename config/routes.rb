Rails.application.routes.draw do
  get 'guinchos/index'
  get 'autos/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :winches
  resources :cars
  resources :trips, only: [:index, :show, :new, :create]
  resources :autos, only: [:index] , defaults: {format: :json}
  resources :guinchos, only: [:index] , defaults: {format: :json}
end
