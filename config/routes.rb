Rails.application.routes.draw do

  # user login/register
  post '/users/login', to: 'authentication#login'
  post '/users/register', to: 'users#create'


  # resources :books
  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
  get '/books/:id', to: 'books#show'
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'

  # resources :categories
  get '/categories', to: 'categories#index'
  post '/categories', to: 'categories#create'
  delete '/categories/:id', to: 'categories#destroy'
  # get '/categories/:id', to: 'categories#show'
  # patch '/categories/:id', to: 'categories#update'
 

  # resources :orders
  get '/orders', to: 'orders#index'
  post '/orders', to: 'orders#create'
  delete '/orders/:id', to: 'orders#destroy'
  # get '/orders/:id', to: 'orders#show'
  # patch '/orders/:id', to: 'orders#update'
  
end
