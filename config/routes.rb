Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :hiking_trips
      resources :group_gear_items, only: [:create, :update, :destroy]
      resources :personal_gear_items, only: [:create, :update, :destroy]
      resources :food_plans, only: [:create, :update, :destroy]
      resources :user_hikes, only: [:create, :destroy] 
      resources :stops, only: [:create, :update, :destroy]
      resources :friendships, only: [:index, :create, :destroy]
      resources :messages, only: [:index, :show, :create]
      get '/friendsTrips', to: 'hiking_trips#friends_trips'
      post '/login', to: 'auth#create'
      delete '/friendships', to: 'friendships#remove_friend'
    end
  end
 
 
end
