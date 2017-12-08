class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def new
  end

  def create
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Updated your information'
    else
      render 'edit'
    end
  end

  def destroy
    get_user
    @user.destroy
      redirect_to root_path
  end

  def makeAdmin
    @user = User.find_by_id(params[:id])
    @user.update_attribute :admin, true
  end

  private

  def get_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :location, :bio, :previous_industry, :github_url, :avatar, :admin)
  end



end
