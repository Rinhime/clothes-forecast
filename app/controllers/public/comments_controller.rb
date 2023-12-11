class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    
    if @comment.save
      # flash[:notice] ="You have created book successfully."
      redirect_to public_post_path(post)
    else
      @posts = Post.all
      redirect_to public_posts_path
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment_text)
  end
  
end
