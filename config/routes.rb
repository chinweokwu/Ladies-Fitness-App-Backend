Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :notepads,only: [:index, :create, :destroy]
      resources :workouts, only: [:show, :index]
      resources :excerises, only: [:show, :index]
    end
  end
end
