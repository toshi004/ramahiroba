class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_list].delete("　").split(/[,|、]/)
    if @post.save
      @post.save_tags(tag_list)
      redirect_to post_posts_thanks_path(@post.id)
    else
      render :new
    end
  end

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(8)
  end

  def pick_up
    case params[:post_sort]
    when "favorite"
      favorites = PostFavorite.where(user_id: current_user.id).pluck(:post_id)
      post = Post.find(favorites)
      @posts = Kaminari.paginate_array(post).page(params[:page]).per(8)
    when "mine"
      @posts = Post.where(user_id: current_user.id).page(params[:page]).per(8)
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_thanks_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to my_page_path
  end

  def thanks
    @post = Post.find(params[:post_id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :text, :emotion, :tag_name)
  end

end
