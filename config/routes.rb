Rails.application.routes.draw do
  root 'trips#index'

  # resources :trips
  # resources :drivers
  # resources :passengers

  get '/trips', to: 'trips#index', as: 'trips'
end
