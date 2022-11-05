Rails.application.routes.draw do
  resources :contents
  resources :areas
  resources :festivals
  resources :shrines
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :contents do
        collection do
          get 'searchYouTube'
        end
      end
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
