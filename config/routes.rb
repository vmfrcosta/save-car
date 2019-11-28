Rails.application.routes.draw do
  devise_for :users
  root to: 'trips#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :winches, except: [:destroy]
  resources :cars
  resources :trips, only: [:index, :show, :new, :create]
  get 'requests/:id', to: 'trip_requests#show', as: 'request_path'
end
