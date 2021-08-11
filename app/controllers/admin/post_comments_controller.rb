class Admin::PostCommentsController < ApplicationController

  def index
    @post_comments = PostComment.all
  end

  def show
    @user = User.find(params[:id])
    @post_comment = PostComment.find(params[:id])
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admin_post_comments_path
  end

end
