Rails.application.routes.draw do
  root 'trips#index'

  resources :trips
  resources :drivers
  resources :passengers

  get '/passengers/:id', to: 'passenger#show', as: 'show_passenger'


end
