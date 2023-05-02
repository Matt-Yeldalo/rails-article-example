Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Define the root entry point using "root", set it to /articles
  root "articles", to: "articles/#index"
  # Define a route path, set to /articles where #index == the controller method handling the route
  get "/articles", to: "articles#index" 
end
