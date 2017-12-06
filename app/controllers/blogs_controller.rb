class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @blog = Blog.find_by_id(:id)
  end

  def show
    @blog = Blog.find_by_id(:id)
    @user = current_user
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @user = User.find_by_id(params[:id])
    @blog.user_id = current_user.id
      if @blog.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def edit
    @blog = Blog.find_by_id(params[:id])
    @user = User.find_by_id(params[:id])
    #@blog.user_id = current_user.id
  end

  def update
    @user = User.find_by_id(params[:id])
    @blog = Blog.find_by_id(params[:id])
    @blog.user_id = current_user.id

    if @blog.update(blog_params)

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
