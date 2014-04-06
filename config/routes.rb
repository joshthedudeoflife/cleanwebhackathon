HackthonProject::Application.routes.draw do
  
  get "login", to: "sessions#new"
  get "logout", to: "sessions#destroy"
  resources :sessions, only: [:create]
  
  resources :users, only: [:new, :create]
  resources :challenges, only: [:show] do 
    resources :steps, only: [:show] do 
      resources :pledges, only: [:create], format: :json
    end
    # javascript controllers
    resources :memberships, only: [:create], format: :json
    resources :green_button_data, only: [:create], format: :json
  end
  root :to => 'home#index'
  
end
