Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :hiking_trips
      resources :group_gear_items, only: [:create, :update, :destroy]
      resources :personal_gear_items, only: [:create, :update, :destroy]
      resources :food_plans, only: [:create, :update, :destroy]
      resources :stops, only: [:create, :update, :destroy]
      post '/login', to: 'auth#create'
    end
  end
 
 
end
