Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  namespace :api do
    namespace :v1 do
      resources :notepads, only: %i[index create destroy]
      resources :workouts, only: %i[show index] do
        resources :excerises, only: %i[show index]
      end
      resources :calories, only: %i[index create destroy]
    end
  end
end
