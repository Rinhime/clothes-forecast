class Admin::CommentsController < ApplicationController
before_action :authenticate_admin!
  def destroy
    # Comment.find(params[:id]).destroy
    comment = Comment.find_by(post_id: params[:post_id])
    comment.destroy
    flash[:notice] = "投稿を削除しました"
    # @post = Comment.post.find(params[:id])
    redirect_to admin_post_path(params[:post_id])
  end

end
