class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @posts = @user.posts.all
  end
  
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to public_root_path
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to public_users_show_path
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    # @post = Post.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
  
end
