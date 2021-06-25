Rails.application.routes.draw do
  resources :comments
  resources :hobbies
  resources :blog_tags
  resources :tags
  resources :categories
  devise_for :users
  resources :blogs 
  get "blogs/categories/:category_slug", to: "blogs#show_category", as: :show_blogs_category
  get "blogs/tags/:id", to: "blogs#show_tag", as: :blogs_tags
  root to: "blogs#index"

  resources :blogs do
    resources :comments
  end
  # get "blogs/new", to: "blogs#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/users"
  namespace :admin do 
    root to: "dashboard#index"
    resources :users
  end
end
