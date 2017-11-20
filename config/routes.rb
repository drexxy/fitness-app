Rails.application.routes.draw do
  
  resources :profiles, only: [:new, :create, :show]
end
