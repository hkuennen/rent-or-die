Rails.application.routes.draw do
  devise_for :users
  root to: "survivalists#index"
  resources :survivalists, only: [:new, :create, :show, :index]
  resources :meetings, only: [:new, :create, :show, :index] # need to iterate in survivalists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
