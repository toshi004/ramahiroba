class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to thanks_path
  end

  def index
    # ヘッダーからの遷移（タブメニュー）
    # お気に入り投稿一覧からの遷移
    # タグ一覧からの遷移
    @posts = Post.page(params[:page]).per(10)
  end

end
