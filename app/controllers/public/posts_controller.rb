class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
  end

  def create
    # 分岐なし
    # @post = Post.new(post_params)
    # @post.user_id = current_user.id

    # @post.save
    # redirect_to public_post_path(@post)

    # 分岐あり
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      # flash[:notice] ="You have created book successfully."
      redirect_to public_post_path(@post)
    else
      @posts = Post.all
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :user_id, :clothe_id)
  end

end