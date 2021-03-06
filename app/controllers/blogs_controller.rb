class BlogsController < ApplicationController
  def index
    get_user
    @blog = Blog.new
    @q = Blog.ransack(params[:q])
    @blogs = @q.result.includes(:user, :tags)
  end

  def search
    index
    render :index
  end

  def show
    get_blog
    @comment = Comment.find_by_id(params[:id])
  end

  def new
    get_user
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
      if @blog.save
        redirect_to blog_path(@blog)
      else
        render 'new', notice: 'Oops.  Something happen.'
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
        redirect_to blog_path(@blog)
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
    @user = User.find_by_id(params[:id])
  end

  def get_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :tag_list)
  end


end
