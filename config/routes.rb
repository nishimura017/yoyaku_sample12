Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  get 'users/profile/edit/', to: 'users/profiles#edit'
  get 'users/profile/show/', to: 'users/profiles#show'
  get '/users/:id', to: 'users/accounts#show'
  patch 'users/:id', to: 'users/profiles#update'
  root to: "home#index"
  resources :users  
  resources :rooms
  resources :homes
  # routes.rb
 
  resources :reservations

end

