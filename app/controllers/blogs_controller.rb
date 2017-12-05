class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by_id(:id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
