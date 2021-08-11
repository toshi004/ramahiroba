class Admin::PostCommentsController < ApplicationController

  def index
    @post_comments = PostComment.all
  end

  def show
  end

  def destroy
  end

end
