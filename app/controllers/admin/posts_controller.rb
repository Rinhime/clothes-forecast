class Admin::PostsController < ApplicationController
before_action :authenticate_admin!
  def show
    @post = Post.find(params[:id])
    @comments = @post.comment.all
    # @user = User.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to admin_users_path
  end

end