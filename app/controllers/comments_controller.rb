class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ destroy ]
  before_action :find_commentable

    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.new(comment_params)

      if @comment.save
        redirect_to :root, notice: 'Your comment was successfully posted!'
      else
        redirect_to :back, notice: "Your comment wasn't posted!"
      end
    end

    def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :root, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Blog.find_by_id(params[:blog_id]) if params[:blog_id]
    end
  end