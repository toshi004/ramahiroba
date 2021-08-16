class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag].split(nil)
    @post.save
    @post.save_tag(tag_list)
    redirect_to thanks_path
  end

  def index
    # ヘッダーからの遷移（タブメニュー）
    # お気に入り投稿一覧からの遷移
    # タグ一覧からの遷移
    @posts = Post.page(params[:page]).per(10)
    @tag_list = Tag.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to my_page_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :text, :emotion)
  end

end
