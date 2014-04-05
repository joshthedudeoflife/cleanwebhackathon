HackthonProject::Application.routes.draw do
get "static_pages/users"

  get "login", to: "sessions#new"
  get "logout", to: "sessions#destroy"


  resources :users, :only => [:new, :create]
  root :to => 'home#index'
  
end
