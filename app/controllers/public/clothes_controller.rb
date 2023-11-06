class Public::ClothesController < ApplicationController
  
  def index
    @clothes = Clothe.all
  end
  
  def show
    @clothe = Clothe.find(params[:id])
    @post = Post.new
  end
  
  
  
end
