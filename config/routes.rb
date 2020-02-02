Rails.application.routes.draw do
  resources :sexes
  


  resources :cities
  resources :states

  devise_for :users, path: "u"
  resources :users

  # token auth routes available at /api/v1/auth
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    post 'cities/find'
    resources :users, only: [:create, :show]
  end

  devise_scope :user do
    authenticated :user do
      root to: 'physical_customers#index'
    end

    unauthenticated do
      root to: 'devise/sessions#new'
    end
  end

  post 'utils/zipcode'
end
