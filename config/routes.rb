Rails.application.routes.draw do
  devise_for :users
  get "/bookings/:id/confirmation", to: "bookings#show", as: :confirmation
  root to: "items#home"
  get "/users/:id", to: "pages#show", as: :user_page
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
