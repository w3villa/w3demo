Rails.application.routes.draw do
  resources :blogs

  root to: "blogs#index"
  # get "blogs/new", to: "blogs#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/users"
end
