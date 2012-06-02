EnglishAssignments::Application.routes.draw do
  #get "home/index"
  
  root :to => "home#index"
  
  get "sign_up" => "users#new", :as => "sign_up"
  
  resources :users

end
