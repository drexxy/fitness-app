Rails.application.routes.draw do

  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
  
  resources :profiles, only: [:new, :create, :show]

  resources :goals, only: [:new, :create]

  resources :exercises, only: [:new, :create, :show, :index]

  resources :workouts, only: [:new]
end
