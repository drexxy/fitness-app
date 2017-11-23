Rails.application.routes.draw do
  
  resources :profiles, only: [:new, :create, :show]

  resources :goals, only: [:new, :create]

  resources :exercises, only: [:new, :create, :show, :index]

  resources :workouts, only: [:new, :create]

  resources :days, only: [:new, :create]
end
