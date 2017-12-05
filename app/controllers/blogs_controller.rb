class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by_id(:id)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
      if @blog.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def edit
    @question = Question.find_by_id(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :user_id)
  end


end
