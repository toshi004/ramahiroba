class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).per(6)
  end

  def follow_index
    @user  = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(4)
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
    if @user.update(user_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
