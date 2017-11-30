Rails.application.routes.draw do

  devise_for :customers, controllers: { confirmations: 'confirmations' }
  
  resources :profiles, only: [:new, :create, :show] do
    member do
      get :matches
      get :workouts
    end
  end
    
  resources :goals, only: [:new, :create]

  resources :exercises, only: [:new, :create, :show, :index]

  resources :workouts, only: [:new, :create, :show]

  resources :days, only: [:new, :create, :index]

  resources :gyms, only: [:index]

  resources :trainer_profiles, only: [:new, :create, :show]

  root to: 'pages#index'
end
