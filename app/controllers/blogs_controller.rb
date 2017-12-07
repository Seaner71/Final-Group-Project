class BlogsController < ApplicationController
  def index
    # get_user
    # @blogs = @user.blogs.all
    @q = Blog.ransack(params[:q])
    @blogs = @q.result.includes(:user, :tags)
  end

  def show
    get_blog
  end

  def new
    get_user
    @blog = Blog.new
  end

  def create
    get_user
    @blog = @user.blogs.new(blog_params)
      if @blog.save
        redirect_to blogs_path(@user)
      else
        render 'index'
      end
  end

  def edit
    get_user
    get_blog
  end

  def update
    get_user
    get_blog
    @blog.update(blog_params)
      if @blog.save
        redirect_to blogs_path
      else
        render 'edit'
      end
    end


  def destroy
    get_blog
    @blog.destroy
      redirect_to blogs_path
  end

  private

  def get_user
    @user = current_user
  end

  def get_blog
    @blog = Blog.find_by_id(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :tag_list)
  end


end
