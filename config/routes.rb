Rails.application.routes.draw do
  
  resources :profiles, only: [:new, :create, :show]

  resources :goals, only: [:new, :create]
end
