class BlogsController < ApplicationController
  def index
    @user = current_user
    @blogs = @user.blogs.all
  end

  def show
    @blog = Blog.find_by_id(params[:id])
  end

  def new
    @user = current_user
    @blog = Blog.new
  end

  def create
    @user = current_user
    @blog = @user.blogs.new(blog_params)
      if @blog.save
        redirect_to user_path(@user)
      else
        render 'index'
      end
  end

  def edit
    @user = current_user
    @blog = Blog.find_by_id(params[:id])
  end

  def update
    @user = current_user
    @blog = Blog.find_by_id(params[:id])
    @blog.update(blog_params)
      if @blog.save
        redirect_to blogs_path
      else
        render 'edit'
      end
    end


  def destroy
    @blog = Blog.find_by_id(params[:id])
    @blog.destroy
      redirect_to blog_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body)
  end


end
