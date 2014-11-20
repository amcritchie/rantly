Rails.application.routes.draw do
  root :to => "home#index"

  get "/" => "home#index"
  resources :users do
    # resources :following, only: [:create, :destroy, :index]
    resources :followings, only: [:create, :destroy, :index]
  end
  resource :session, only: [:new, :create, :destroy]
  resource :search, only: [:show]
  # resource :following, only: [:new, :create, :destroy]
  resources :rants do
    resources :favorites, only: [:create, :destroy, :index]
    resources :rant_comments, only: [:new, :create, :destroy]
    resources :spams, only: [:create, :destroy, :index]
  end

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy", as: :signout

  get "confirm_email/:confirmation_token" => 'mail_confirmer#confirm_and_destroy', as: 'email_confirmer'

end
