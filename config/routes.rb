Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :winches, except: [:destroy]
  resources :cars
  resources :trips, only: [:index, :show, :new, :create]

end
