class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    get_user
  end

  def edit
    get_user
  end

  def new
  end

  def create
  end

  def update
    get_user
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

  private

  def get_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :location, :bio, :previous_industry, :github_url, :avatar)
  end



end
