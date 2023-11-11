class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      # flash[:notice] ="You have created book successfully."
      redirect_to public_post_path(@post)
    else
      @posts = Post.all
      redirect_to public_posts_path
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment_text, :user_id, :post_id)
  end
  
end
