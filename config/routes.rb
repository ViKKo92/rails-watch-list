Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :lists, only: [:index, :show, :new, :create] do
    get "bookmarks/new", to: "bookmarks#new", as: "new_bookmark"
    post "bookmarks", to: "bookmarks#create", as: "bookmarks"
  end

  delete "bookmarks/:id", to: "bookmarks#destroy", as: "delete_bookmark"
  delete "lists/:id", to: "lists#destroy", as: "delete_list"
  
  resources :movies, only: [:show]
end
