class Public::UsersController < ApplicationController

  def index
    # if path[:controller] == "public/users" && path[:action] == "my_page"
      # user = User.find(params[:user_id])
      # @users = user.followings.page(params[:page]).per(8)
    # else
      @users = User.page(params[:page]).per(6)
    # end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.page(params[:id]).per(4)
  end

  def my_page
    @user = current_user
    @posts = @user.posts.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to my_page_path
  end

  def unsubscribe
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :image_id, :introduction)
  end

end
