Rails.application.routes.draw do
  resources :hobbies
  resources :blog_tags
  resources :tags
  resources :categories
  devise_for :users
  resources :blogs 
  get "blogs/categories/:category_slug", to: "blogs#show_category", as: :show_blogs_category
  get "blogs/tags/:id", to: "blogs#show_tag", as: :blogs_tags
  root to: "blogs#index"
  # get "blogs/new", to: "blogs#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/users"

      resources :blogs do
          resources :comments
      end

      resources :comments do
          resources :comments
      end
      
  namespace :admin do 
    root to: "dashboards#index"
    resources :users
    get "blogs/", to: "dashboards#blogs"
    get "category/", to: "dashboards#category"
    get "tag/", to: "dashboards#tag"
   
  end
end