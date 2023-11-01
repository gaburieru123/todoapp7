Rails.application.routes.draw do
  get "/" => "tasks#index"
  root :to =>  "tasks#index"
  get "tasks/new" => "tasks#new"
  post "tasks/create" => "tasks#create"
  get "tasks/show/:id" => "tasks#show", as: 'tasks_show_id' #asでprefix名（tasks_show_id）をつけている。
  get "tasks/edit/:id" => "tasks#edit"
  post "tasks/update/:id" => "tasks#update"
  delete "tasks/:id" => "tasks#destroy"
  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
