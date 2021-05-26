Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :blogs 
  get "blogs/categories/:category_id", to: "blogs#show_category", as: :show_blogs_category

  root to: "blogs#index"
  # get "blogs/new", to: "blogs#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/users"
end
