Rails.application.routes.draw do
  resources :destination_foods
  resources :destination_activities
  resources :likes, only: [:show, :create]
  resources :foods, only: [:show, :index]
  resources :activities, only: [:show, :index]
  resources :trips
  resources :destinations, only: [:show, :index]
  get '/countries/:name', to:'countries#show'
  resources :users

  root to: 'welcome#home'

  patch '/activities/:id/dislikes', to: 'activities#dislikes', as: 'dislikes'
  patch '/activities/:id/add_likes', to: 'activities#add_likes', as:'add_likes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
