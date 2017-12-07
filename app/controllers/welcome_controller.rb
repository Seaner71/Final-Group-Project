class WelcomeController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show

  end

  def new

  end

  def create

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
