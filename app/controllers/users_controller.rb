class UsersController < ApplicationController
  def show
    get_user

  end

  def edit
    get_user
  end

  def new

  end

  def create
    @blog = current_user.posts.new(blog_params)
      if @blog.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def update
    get_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Updated your information'
    else
      render 'edit'
    end
  end

  private

  def get_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :location, :bio, :previous_industry, :github_url)
  end

  def blog_params
    params.permit(:title, :body, :user_id)
  end


end
