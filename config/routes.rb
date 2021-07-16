Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
    
  namespace :api do
    namespace :v1 do
      resources :notepads,only: [:index, :create, :destroy]
      resources :workouts, only: [:show, :index] do
      resources :excerises, only: [:show, :index]
      end
      resources :calories,only: [:index, :create, :destroy]
    end
  end
end
