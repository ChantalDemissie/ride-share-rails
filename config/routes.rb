Rails.application.routes.draw do
  root 'trips#index'

  resources :trips
  resources :drivers
  resources :passengers

end
