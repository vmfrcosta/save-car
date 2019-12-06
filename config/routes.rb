Rails.application.routes.draw do
  get 'guinchos/index'
  get 'autos/index'
  get 'requests/:id', to: 'trip_requests#show', as: 'request'
  get 'trip/trips_room/:id', to: 'trips#show', as: 'trip_room'
  get 'trip/trips_room/:id/update_location', to: 'trips#update_win_location', as: 'trip_win_loc'
  get 'delivered/:id', to: 'trips#delivered', as: 'delivered_trip'

  devise_for :users

  resources :winches
  resources :cars
  resources :trips, only: [:index, :show, :new, :create, :update]
  resources :autos, only: [:index] , defaults: {format: :json}
  resources :guinchos, only: [:index] , defaults: {format: :json}

  root to: 'pages#home'

  resources :users do
    resources :winches
    resources :cars
  end
  mount ActionCable.server => '/cable'
end
