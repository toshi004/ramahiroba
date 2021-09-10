class Public::PostFavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    if post.user_id != current_user.id
       @favorite = PostFavorite.create(user_id: current_user.id, post_id: post.id)
       redirect_to request.referer
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = PostFavorite.find_by(user_id: current_user.id, post_id: post.id)
    favorite.destroy
    redirect_to request.referer
  end

end
