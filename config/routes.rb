require 'resque_web'

Rails.application.routes.draw do
  resources :turns
  resources :regions
  resources :local_participation_records
  resources :boards
  resources :user

  root 'boards#show'

  match '/auth/:provider/callback', to: 'sessions#create_from_omniauth', via: [:get, :post]
  get '/logout', to: 'sessions#destroy'

  mount ResqueWeb::Engine => '/resque_web'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
