Rails.application.routes.draw do
  
  resources :profiles, only: [:new, :create, :show]

  resources :goals, only: [:new, :create]

  resources :exercises, only: [:new, :create, :show, :index]
end
