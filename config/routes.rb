Rails.application.routes.draw do
  resources :destination_foods
  resources :destination_activities
  resources :likes, only: [:show, :create]
  resources :foods, only: [:show, :index]
  resources :activities, only: [:show, :index]
  resources :destinations, only: [:show, :index]
  resources :login, only: [:new, :create]

  get '/countries/:name', to:'countries#show'
  get '/welcome/stats', as: 'stats'
  
  root to: 'welcome#home'
  resources :users do
    resources :trips, controller: 'users/trips', controller: 'users/trips'
  end


  post 'activities/:trip', to: 'activities#addactivities', as: 'add_activities'
  post 'destinations/:trip', to: 'destinations#adddestination', as: 'add_destination'

  patch '/activities/:id/dislikes', to: 'activities#dislikes', as: 'dislikes'
  patch '/activities/:id/add_likes', to: 'activities#add_likes', as:'add_likes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


