Rails.application.routes.draw do
  resources :destination_foods
  resources :destination_activities
  resources :likes
  resources :foods, only: [:show, :index]
  resources :activities, only: [:show, :index]
  resources :trips
  resources :destinations, only: [:show, :index]
  resources :users, only: [:show,:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
