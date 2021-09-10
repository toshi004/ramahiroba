class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_comment = PostComment.where(user_id: @user.id, report: true)
  end

  def update
    case params[:suspended_sort]
    when "false"
      @user = User.find(params[:id])
      @user.suspended = true
      @user.update(user_params)
      redirect_to request.referer
    when "true"
      @user = User.find(params[:id])
      @user.suspended = false
      @user.update(user_params)
      redirect_to request.referer
    end
  end

  private

  def user_params
    params.permit(:suspended)
  end

end
