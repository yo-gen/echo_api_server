Rails.application.routes.draw do
  jsonapi_resources :endpoints
  match '*path', controller: 'endpoints', action: 'mock', via: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
