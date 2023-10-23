Rails.application.routes.draw do
  get "/" => "tasks#index"
  root to:  "tasks#index"
  get "tasks/new" => "tasks#new"
  post "tasks/create" => "tasks#create"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
