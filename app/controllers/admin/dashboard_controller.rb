class Admin::DashboardController < Admin::ApplicationController
before_action :set_data, only: %i[ index]
before_action :fetch_all_categories, only: %i[ index]
before_action :fetch_all_tags, only: %i[ index]



  def index
   
  end








 private

  def set_data
    @admin = current_user.name
    @users = User.all
    @blogs = Blog.all
  end 
  
  def fetch_all_categories
    @categories = Category.all
  end

  def fetch_all_tags
    @tags = Tag.all
  end


end
