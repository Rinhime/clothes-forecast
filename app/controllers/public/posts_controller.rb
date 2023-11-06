class Public::PostsController < ApplicationController

  def index
  end

  def show
  end
  
  def create
    post = Post.new(post_params)
    post.save
    redirect_to public_post_path(post.id)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:post_text, :user_id, :celsius)
  end
  
end