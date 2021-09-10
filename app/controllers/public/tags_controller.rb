class Public::TagsController < ApplicationController

  def index
    @tag_list = Tag.all
  end

  def search
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.page(params[:page]).per(8)
  end
end
