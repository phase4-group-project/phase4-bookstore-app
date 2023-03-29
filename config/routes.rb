Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # user
  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'
  delete '/users/logout', to: 'users#logout'
  get '/user/login/check', to: 'users#check_login_status'
  get '/me', to: 'application#user'

  # books
  post '/books', to: 'books#create'
  put '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
  get '/books', to: 'books#index'

  # oreders
  get '/orders', to: "orders#index"
  post '/orders', to: "orders#create"
  get '/orders/:id', to: "orders#show"

end
