Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :survivalists do
    resources :meetings, only: [:new, :create, :show, :index]
  end
  resources :meetings, only: [:destroy]
  resources :pages, only: [:index, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
