class CommentsController < ApplicationController
  def show
    @blog = Blog.find_by_id(params[:id])
    @comment = Comment.find_by_id(params[:id])
  end


  def create
    get_blog
    @comment = @blog.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @blog
  end

  def destroy
    get_blog
    @comment = @blog.comments.find_by_id(params[:id])
    @comment.destroy
    redirect_to blog_path(@blog)
  end

  private

    def get_blog
      @blog = Blog.find(params[:blog_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

end
