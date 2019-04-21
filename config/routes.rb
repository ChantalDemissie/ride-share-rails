# frozen_string_literal: true

Rails.application.routes.draw do
  root 'trips#index', as: 'home'

  resources :trips
  resources :drivers
  resources :passengers

  post '/trips/:id/rating', to: 'trips#update_rating', as: 'update_rating'
end
