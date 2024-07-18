# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :messages, only: %i[create]

  get    '/signin',  to: 'sessions#new',     as: :login
  post   '/signin',  to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: :logout

  root to: "chat#index"
end
