# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'Client', at: 'auth'
  mount_devise_token_auth_for 'Admin', at: 'auth_admin'

  namespace :admin do
    resources :admins, only: %i[index show create destroy]
    resources :clients, only: %i[index show create destroy]
  end
end