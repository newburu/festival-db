Rails.application.routes.draw do
  resources :contents
  resources :areas
  resources :festivals
  resources :shrines
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
