Rails.application.routes.draw do
  get 'guinchos/index'
  get 'autos/index'
  get 'requests/:id', to: 'trip_requests#show', as: 'request_path'
  get 'trip/trips_room/:id', to: 'trips#show', as: 'trip_room'

  devise_for :users

  resources :winches
  resources :cars
  resources :trips, only: [:index, :show, :new, :create]
  resources :autos, only: [:index] , defaults: {format: :json}
  resources :guinchos, only: [:index] , defaults: {format: :json}

  root to: 'trips#new'

  resources :users do
    resources :winches
    resources :cars
  end
end
