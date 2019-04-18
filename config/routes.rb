# frozen_string_literal: true

Rails.application.routes.draw do
  root 'trips#index', as: 'home'

  resources :trips
  resources :drivers
  resources :passengers

  # resources :passengers do
  #   resources :trips
  # end

  post '/passengers', to: 'passengers#create'

  get '/passengers/:id', to: 'passenger#show', as: 'show_passenger'
  patch '/passengers/:id', to: 'passengers#update'
  delete '/passengers/:id', to: 'passengers#destroy', as: 'delete_passenger'

  get '/passengers/:passenger_id/trips/:trip_id', to: 'trips#show', as: 'show_trip_details'
  delete '/trips/:id', to: 'trips#destroy', as: 'delete_trip'

end
