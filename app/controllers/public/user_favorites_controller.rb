class Public::UserFavoritesController < ApplicationController

  def create
    following = current_user.follow(@user)
    following.save
    redirect_to @user
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    redirect_to @user
  end

  private

  def user
    @user = User.find(params[:user_favorite][:follow_id])
  end

end
