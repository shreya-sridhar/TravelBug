Rails.application.routes.draw do
  resources :destination_foods
  resources :destination_activities
  resources :likes
  # resources :users
  # resources :trips
  resources :foods, only: [:show, :index]
  resources :activities, only: [:show, :index]
  resources :destinations, only: [:show, :index]
  get '/countries/:name', to:'countries#show'
  root to: 'welcome#home'
  resources :users do
    resources :trips, controller: 'users/trips', controller: 'users/trips'
  end
  post 'activities/:trip', to: 'activities#addactivities', as: 'add_activities'
  post 'destinations/:trip', to: 'destinations#adddestination', as: 'add_destination'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


