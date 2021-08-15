class Public::UsersController < ApplicationController

  def index
    if path[:controller] == "public/users" && path[:action] == "my_page"
      user = User.find(params[:user_id])
      @users = user.followings.page(params[:page]).per(8)
    else
      @users = User.page(params[:page]).per(8)
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.page(params[:id]).per(4)
  end

end
