require 'sidekiq/web'

Rails.application.routes.draw do
  # mount Sidekiq::Web => '/sidekiq'

  root 'welcome#index'

  namespace :owner do
    resource :session, only: [:new, :create, :destroy]
    resource :profile, only: [:edit, :update]
    resources :assistants, only: [:index, :show]
    resources :deliveries, except: :destroy
    resources :things, only: [:edit, :update, :destroy]
    resources :shops
  end

  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resources :assistants
    resource :profile, only: [:edit, :update]
    resources :deliveries, only: [:index, :show, :edit, :update] do
      resources :things, only: [:new, :create, :update]
    end
    resources :things, only: :show
    resources :shops, only: [:index, :show]
  end

  namespace :assistant do
    resource :session, only: [:new, :create, :destroy]
    resources :things, only: [:index, :show, :edit, :update]
  end
end
