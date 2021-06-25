class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :fetch_all_categories, only: %i[ index show_category show show_tag]
  before_action :fetch_all_tags, only: %i[ index show_tag  show_category]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end


  def show_category
    @category = Category.where(slug: params[:category_slug]).first
    @blogs = @category.blogs
  end

  def show_tag
    @tag =  Tag.find(params[:id])
    @blogs_tags = @tag.blogs
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params.merge(user_id: current_user.id))
    

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def fetch_all_categories
      @categories = Category.all
    end

    def fetch_all_tags
      @tags = Tag.all
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      
      params.require(:blog).permit(:title, :body, :user_id, :category_id, :tag_list,:tag_id, :image , blog_tags_attributes: [:id ,:tag_id, :_destroy], :tag_ids =>[])
    end
end
