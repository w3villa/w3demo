 class CommentsController < ApplicationController

  before_action :find_commentable


     def index
      @comments = Comment.all
     end
    def new
      @comment = Comment.new
    end
    def show
      @comment = Comment.find(params[:id])
    end
    def edit
      @comment = Comment.find(params[:id])
    end


    def create

      @comment = @commentable.comments.new(comment_params)
      if @comment.save
        redirect_to :blogs, notice: 'Your comment was successfully posted!'
      else
        redirect_to :blogs, notice: "Your comment wasn't posted!"
      end
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

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable

      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Blog.friendly.find_by_id(params[:blog_id]) if params[:blog_id]
    end
  end