Rails.application.routes.draw do
  root 'trips#index', as: 'home'

  resources :trips
  resources :drivers
  resources :passengers

  post '/passengers', to: 'passengers#create'


  get '/passengers/:id', to: 'passenger#show', as: 'show_passenger'
  patch '/passengers/:id', to: 'passengers#update'
  delete '/passengers/:id', to: 'passengers#destroy', as: 'delete_passenger'

  get '/passengers/:id/trips/:id', to: 'trips#show', as: 'trip_details'





end
