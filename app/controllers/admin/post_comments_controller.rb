class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

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
    @post_comment = PostComment.find(params[:id])
  end

  def update
    comment = PostComment.find(params[:id])
    comment.update(report: false)
    redirect_to  admin_post_comments_path
  end

end
