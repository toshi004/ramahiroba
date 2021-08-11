class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.suspended = true
    @user.update(user_params)
    redirect_to admin_users_path
  end

  private

  def user_params
    params.permit(:suspended)
  end

end
