Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "users/profile/edit/", to: "users/profiles#edit"
  get "users/profile/show/", to: "users/profiles#show"
  get "/users/:id", to: "users/accounts#show"
  patch "users/:id", to: "users/profiles#update"
  root to: "home#index"
  resources :users
  resources :rooms
  post "/rooms/:id", to: "reservations#create", as: "room_reservation"
  resources :homes
  resources :reservations

  resources :rooms do
    resources :reservations, only: [:create]
  end

  get "room/search", to: "rooms#search"

  resources :users do
    collection do
      get "search"
    end
  end

  # GET /rooms/in_area/:area
  get "/rooms/in_area/:area", to: "rooms#in_area"
  # GET /rooms/search/:query
  get "/rooms/search/:query", to: "rooms#search"

  get "room/result", to: "rooms#result", as: "room_result"

  get "reservation/confirm", to: "reservations#confirm"
  post "reservation/confirm", to: "reservations#confirm"
  get "rooms/:id/reservations", to: "rooms#show"
end
