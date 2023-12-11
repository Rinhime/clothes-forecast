class Public::PostsController < ApplicationController
before_action :authenticate_user!
  
  def index
    # 検索フォームに入力があった場合
    if params[:search].present?
      @posts = Post.posts_serach(params[:search])
    # タグで絞込んだ場合
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @posts = Post.includes(:post_tags).where('post_tags.tag_id': @tag.id).order(created_at: :desc)
    # 普通にページを表示させた場合
    else
      
      @post = Post.new
      @posts = Post.all.order(created_at: :desc)
    end
    @tag_list = Tag.all

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comment.all
    @comment = Comment.new
    #@post_tag_list = @post.tag
  end

  def create
    # 分岐あり
    @post = current_user.posts.build(post_params)
    #binding.pry
    #tag_list = params[:post][:post_tag][:tag_name].split(nil)
    #@post.user_id = current_user.id
    # tag_list = params[:post][:tag_name].split(',')
    if @post.save
      # flash[:notice] ="You have created book successfully."
      #@post.save_posts(tag_list)
      redirect_to public_post_path(@post)
    else
      # @clothe = Clothe.find(params[:id])
      # @post = Post.new
      # @post.post_tags.build
      # @tag = Tag.new
      @posts = Post.all
      @tag_list = Tag.all
      render :index
      # redirect_to public_clothe_path(@clothe.id)
    end
  end
  
  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      # @posts = @users.posts.all
    else
      @posts = Post.looks(params[:search], params[:word])
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
    params.require(:post).permit(:text, :user_id, :clothe_id, post_tags_attributes: [:tag_name, :_destroy] )
  end



end