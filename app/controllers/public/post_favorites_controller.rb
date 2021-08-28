class Public::PostFavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    if @post.user_id != current_user.id
       @favorite = Post_favorite.create(user_id: current_user.id, post_id: @post.id)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = Post_favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destroy
  end

end
