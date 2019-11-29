Rails.application.routes.draw do
  devise_for :users
  root to: 'trips#new'

  resources :winches, only: [:index, :show, :create]
  resources :cars
  resources :trips, only: [:index, :show, :new, :create]

  namespace :winch do
    resources :winches
  end
  end
