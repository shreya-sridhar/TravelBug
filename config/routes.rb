Rails.application.routes.draw do
  resources :destination_foods
  resources :destination_activities
  resources :likes, only: [:show, :create]
  resources :foods, only: [:show, :index]
  resources :activities, only: [:show, :index, :edit, :update]
  resources :destinations, only: [:show, :index]
  resources :login, only: [:new, :create]
  resources :destination_activities
  resources :trips

  get '/countries/:name', to: 'countries#show', as: 'countries'
  get '/users/stats', to: 'users#stats', as: 'stats'
  get '/packages/:name', to: 'packages#show', as: 'packages'
  post '/packages/:name', to: 'packages#edit', as: 'edit_packages'
  patch '/packages/:name', to: 'packages#update', as: 'patch_packages'
  
  # root to: 'welcome#home'
  # resources :users do
  #   resources :trips, controller: 'users/trips', controller: 'users/trips'
  # end

  namespace 'welcome' do
    root :to => "welcome#home"
  end

  post 'activities/:trip', to: 'activities#addactivities', as: 'add_activities'
  post 'destinations/:trip', to: 'destinations#adddestination', as: 'add_destination'

  patch '/activities/:id/dislikes', to: 'activities#dislikes', as: 'dislikes'
  patch '/activities/:id/add_likes', to: 'activities#add_likes', as:'add_likes'

  delete "logout", to: "login#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


