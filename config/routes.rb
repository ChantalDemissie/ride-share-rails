# frozen_string_literal: true

Rails.application.routes.draw do
  root 'trips#index', as: 'home'

  resources :trips
  resources :drivers
  resources :passengers

  # get '/passengers/new', to: 'passengers#new'

  # post '/passengers/create', to: 'passengers#create', as: 'create_passenger_path'
  # get '/passengers/:id', to: 'passenger#show', as: 'show_passenger'
  # patch '/passengers/:id', to: 'passengers#update'
  # delete '/passengers/:id', to: 'passengers#destroy', as: 'destroy_passenger'
  # get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'


  get '/passengers/:passenger_id/trips/:trip_id', to: 'trips#show', as: 'show_trip_details'
  # post '/trips', to: 'trips#new'
  # patch '/trips/:id', to: 'trips#update', as: 'update_trip'
  post '/trips/:id/rating', to: 'trips#update_rating', as: 'update_rating'
  # post '/passengers/:passenger_id/trips/:trip_id', to: 'trips#create', as: 'request_trip'

  # delete '/trip/:id', to: 'trips#destroy'

end
