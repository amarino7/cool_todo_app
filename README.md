#Outline of Todo App

##Models
###User
* email:string
* password_digest:string
* first_name:string
* last_name:string
* **has_many** Todos

###Todo
* content:string
* complete:boolean
* created_at:datetime
* **belongs_to** User

##Controllers
###Site
* index
* signup
* login
* contact
* about

###User
* index
* create

###Todo
* index
* create
* edit
* destroy
* show

##Routes
###GET
* '/' -> `site#index`
* '/signup' -> `site#signup`
* '/login' -> `site#login`
* '/contact' -> `site#contact`
* '/about' -> `site#about`
* '/users/:id' -> `user#index`
* '/todos' -> `todo#index`
* '/todos/:id' -> `todo#show`
* '/todos/new' -> `todo#new`
* '/todos/edit' -> `todo#edit`

###POST
* '/users' -> `user#create`
* '/todos' -> `todo#create`

###PATCH or PUT
* '/todos/:id' -> `todo#edit`

###DELETE
* '/todos/:id' -> `todo#delete`

