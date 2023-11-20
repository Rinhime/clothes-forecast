class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
    @tag_list = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comment.all
    @comment = Comment.new
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
    tag_list = params[:post][:tag_name].split(',')
    if @post.save
      # flash[:notice] ="You have created book successfully."
      @post.save_tag(tag_list)
      redirect_to public_post_path(@post)
    else
      @posts = Post.all
      render :index
    end
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = Tag.all
    　#検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
    　#検索されたタグに紐づく投稿を表示
    @posts = @tag.posts
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to public_users_show_path
  end
  private

  def post_params
    params.require(:post).permit(:text, :user_id, :clothe_id)
  end
  
  def article_params
    params.require(:)

end