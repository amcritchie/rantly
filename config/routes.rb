Rails.application.routes.draw do
  root :to => "home#index"

  get "/" => "home#index"

  resource :admin, only: [:show] do
    get 'delete' => 'admins#delete'
    get 'resolve' => 'admins#resolve'
  end

  resources :users do
    # resources :following, only: [:create, :destroy, :index]
    resources :user_comments, only: [:new, :create, :destroy]
    resources :followings, only: [:create, :destroy, :index]
    get '/disable' => 'users#disable'
    get '/undisable' => 'users#undisable'

  end
  resource :session, only: [:new, :create, :destroy]
  resource :search, only: [:show]
  # resource :following, only: [:new, :create, :destroy]
  resources :rants do
    resources :favorites, only: [:create, :destroy, :index]
    resources :rant_comments, only: [:new, :create, :destroy]
    # resources :spams, only: [:create, :destroy, :index]

    get '/spam' => 'rants#spam'
    get '/unspam' => 'rants#unspam'
  end

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy", as: :signout

  get "confirm_email/:confirmation_token" => 'mail_confirmer#confirm_and_destroy', as: 'email_confirmer'

end
