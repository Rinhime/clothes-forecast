class Public::PostsController < ApplicationController

  def index
    # 検索フォームに入力があった場合
    if params[:search].present?
      @posts = Post.posts_serach(params[:search])
    # タグで絞込んだ場合
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.post.order(created_at: :desc)
    # 普通にページを表示させた場合
    else
      @posts = Post.all.order(created_at: :desc)
    end
    @tag_list = Tag.all
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comment.all
    @comment = Comment.new
    #@post_tag_list = @post.tag
  end

  def create
    # 分岐あり
    @post = Post.new(post_params)
    #binding.pry
    tag_list = params[:post][:post_tag][:tag_name].split(nil)
    @post.user_id = current_user.id
    # tag_list = params[:post][:tag_name].split(',')
    if @post.save
      # flash[:notice] ="You have created book successfully."
      #@post.save_posts(tag_list)
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
    params.require(:post).permit(:text, :user_id, :clothe_id, post_tags_attributes: [:tag_name])
  end



end