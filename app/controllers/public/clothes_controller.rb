class Public::ClothesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @clothes = Clothe.all
    @tag_list = Tag.all
  end

  def show
    unless user_signed_in?
    flash[:notice] = "ログインしてください"
    redirect_to root_path
    end
    @clothe = Clothe.find(params[:id])
    @post = Post.new
    @post.post_tags.build
    @tag = Tag.new
  end


end