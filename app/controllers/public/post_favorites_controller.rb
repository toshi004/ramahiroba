class Public::PostFavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    if post.user_id != current_user.id
       post.favorite
    end
  end

  def destroy
    post_favorite = Post_favorite.find_by(user_id: current_user.id, post_id: @post.id)
    post_favorite.destroy
  end

end
