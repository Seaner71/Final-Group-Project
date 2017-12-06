class BlogsController < ApplicationController
  def index
    @user = current_user
    @blogs = @user.blogs.all
    @blog = @user.blogs.find_by_id(params[:id])
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @blog = @user.blogs.find_by_id(params[:id])
  end

  def new
    @user = User.find_by_id(params[:id])
    @blog = @user.blogs.new
  end

  def create
    @user = current_user
    @blog = @user.blogs.new(blog_params)

      if @blog.save
        redirect_to user_blogs_path(@user)
      else
        render 'new'
      end
  end

  def edit
  end

  def update
  end

  def destroy
    @blog = Blog.find_by_id(params[:id])
    @blog.destroy
      redirect_to blog_path
  end

  private
  def blog_params
    params.permit(:title, :body)
  end


end
