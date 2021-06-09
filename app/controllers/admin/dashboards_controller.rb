class Admin::DashboardsController < Admin::ApplicationController

 def index
     @admin = current_user.name
      @blogs = Blog.all
      @categories = Category.all  
      @tags = Tag.all  
      @users = User.all
     
  end
  def blogs
    @admin = current_user.name
    @blogs = Blog.all
   
  end
  def category
    @admin = current_user.name
    @categories = Category.all  
  end
   def tag
    @admin = current_user.name
    @tags = Tag.all  
  end
end
