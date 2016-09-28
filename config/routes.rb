require 'sidekiq/web'

Rails.application.routes.draw do
  # mount Sidekiq::Web => '/sidekiq'

  root 'welcome#index'

  namespace :owner do
    resource :session, only: [:new, :create, :destroy]
    resource :profile, only: [:edit, :update]
    resources :deliveries, except: :destroy
    resources :things, only: [:edit, :update, :destroy]
    resources :shops
  end

  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resource :profile, only: [:edit, :update]
    resources :deliveries, only: [:index, :show, :edit, :update]
    resources :things, only: [:new, :show, :create, :update]
    resources :shops, only: [:index, :show]
  end
end
