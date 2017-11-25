Rails.application.routes.draw do

  devise_for :customers, controllers: { confirmations: 'confirmations' }
  
  resources :profiles, only: [:new, :create, :show]

  resources :goals, only: [:new, :create]

  resources :exercises, only: [:new, :create, :show, :index]

  resources :workouts, only: [:new, :create]

  resources :days, only: [:new, :create, :index]

  resources :trainer_profiles, only: [:new, :create, :show]

  root to: 'exercises#index'
end
