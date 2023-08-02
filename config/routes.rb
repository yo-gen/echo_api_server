Rails.application.routes.draw do
  jsonapi_resources :endpoints
  get '*path', controller: 'endpoints', action: 'mock'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
