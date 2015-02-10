Rails.application.routes.draw do
 
  root to: "site#index"

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/sign_up", to: 'users#new', as: "sign_up"
  resources :users

  # resources :sessions

 # delete "/sessions", to: "/sessions#destroy", as: "delete_session"

  get "/contact", to: "site#contact"
  get "/about", to: "site#about"

  get "/users/:user_id/tasks", to: "tasks#index", as: "tasks"
  get "/users/:user_id/tasks/new", to: "tasks#new", as: "new_task"
  get "/users/:user_id/tasks/:task_id", to: "tasks#show", as: "task"
  get "/users/:user_id/tasks/:task_id/edit", to: "tasks#edit", as: "edit_task"


  post "/users/:user_id/tasks", to: "tasks#create"
  patch "/users/:user_id/tasks/:task_id", to: "tasks#update"
  delete "/users/:user_id/tasks/:task_id", to: "tasks#destroy", as: "destroy_task"

end
