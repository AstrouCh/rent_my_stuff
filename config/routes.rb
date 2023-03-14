Rails.application.routes.draw do
  devise_for :users
  root to: "items#home"
  get "/users/:id", to: "pages#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update, :destroy, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"

  resources :user, only: [:show]
end
