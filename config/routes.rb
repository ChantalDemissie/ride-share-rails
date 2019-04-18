# frozen_string_literal: true

Rails.application.routes.draw do
  root 'trips#index', as: 'home'

  resources :trips
  resources :drivers
  resources :passengers

  post '/passengers', to: 'passengers#create'
  get '/passengers/:id', to: 'passenger#show', as: 'show_passenger'
  patch '/passengers/:id', to: 'passengers#update'
  delete '/passengers/:id', to: 'passengers#destroy', as: 'delete_passenger'

  get '/passengers/:passenger_id/trips/:trip_id', to: 'trips#show', as: 'show_trip_details'
  post '/trips', to: 'trips#create'
  patch '/trips/:id', to: 'trips#update', as: 'update_trip'
  post '/trips/:id/rating', to: 'trips#update_rating', as: 'update_rating'

  delete '/trips/:id', to: 'trips#destroy', as: 'delete_trip'


  post '/drivers', to: 'drivers#create'
  get '/drivers/:id', to: 'driver#show'
  patch '/drivers/:id', to: 'drivers#update'
  delete '/drivers/:id', to: 'drivers#delete'

end
