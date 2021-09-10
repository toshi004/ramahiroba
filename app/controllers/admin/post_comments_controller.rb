class Admin::PostCommentsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      @post_comments = PostComment.where(user_id: user.id, report: true)
    else
      @post_comments = PostComment.where(report: true)
    end
  end

  def show
    @user = User.find(params[:id])
    @post_comment = PostComment.where(user_id: @user.id, report: true)
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admin_post_comments_path
  end

end
