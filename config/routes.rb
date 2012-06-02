EnglishAssignments::Application.routes.draw do
  get "login" => "sessions#new", :as => "login"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  #get "home/index"
  
  root :to => "home#index"
  
  resources :users
  resources :sessions
end
