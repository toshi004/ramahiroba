class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save!
      tag_list = params[:post][:tag_name].delete(" ").split(/[,|、]/)
      @post.save_tags(tag_list)
      redirect_to posts_thanks_path
    else
      render new_post_path
    end
  end

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(8)
  end

  def pick_up
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
    @post.update(post_params)
    redirect_to posts_thanks_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to my_page_path
  end

  def thanks
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :text, :emotion, { tag_name: [] } )
  end

end
