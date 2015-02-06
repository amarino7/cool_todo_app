Rails.application.routes.draw do
  root to: "site#index"

  get "/signup", to: 'site#signup'
  get "/login", to: "site#login"
  get "/contact", to: "site#contact"
  get "/about", to: "site#about"

  get "/tasks", to: "tasks#index", as: "tasks"
  get "/tasks/new", to: "tasks#new", as: "new_task"
  get "/tasks/:id", to: "tasks#show", as: "task"
  get "/tasks/:id/edit", to: "tasks#edit", as: "edit_task"


  post "/tasks", to: "tasks#create"
  patch "/tasks/:id", to: "tasks#update"
  delete "/tasks/:id", to: "tasks#destroy"
end
