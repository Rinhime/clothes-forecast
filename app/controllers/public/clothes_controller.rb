class Public::ClothesController < ApplicationController
  
  def index
    @clothes = Clothe.all
    @tag_list = Tag.all
  end
  
  def show
    @clothe = Clothe.find(params[:id])
    @post = Post.new
    @tag_list = @post.tag.pluck(:tag_name).join(',')
  end
  
  # def create
  #   @post = Post.new(post_params)
  #   @post.user_id = current_user.id
  #   if @post.save
  #     redirect_to public_post_path(@post)
  #   else
  #     render :index
  #   end
  # end
    
  # private
  
  # def post_params
  #   params.require(:post).permit(:text, :user_id, :clothe_id)
  # end
  
end