require 'resque_web'

Rails.application.routes.draw do
  resources :turns
  resources :regions
  resources :local_participation_records
  resources :boards
  resources :user

  root 'boards#show'

  mount ResqueWeb::Engine => '/resque_web'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
