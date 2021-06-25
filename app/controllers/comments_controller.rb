class CommentsController < ApplicationController

  before_action :find_commentable
  before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    @comments = Comment.all
  end

  
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.new(comment_params)

      if @comment.save
        redirect_to :blogs, notice: 'Your comment was successfully posted!'
      else
        redirect_to :back, notice: "Your comment wasn't posted!"
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Blog.friendly.find(params[:blog_id]) if params[:blog_id]
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end


  end