Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: :registrations,
    sessions: :sessions
  }
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
