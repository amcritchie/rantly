Rails.application.routes.draw do
  root :to => "home#index"

  get "/" => "home#index"
  resources :users
  resource :session, only: [:new, :create, :destroy]

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy", as: :signout

end
