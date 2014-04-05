HackthonProject::Application.routes.draw do
  
  get "login", to: "sessions#new"
  get "logout", to: "sessions#destroy"
  resources :sessions, only: [:create]
  
  resources :users, only: [:new, :create]
  resources :challenges, only: [:show] do 
    resources :memberships, only: [:create], format: :json
  end
  root :to => 'home#index'
  
end
