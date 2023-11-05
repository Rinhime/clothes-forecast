class Public::ClothesController < ApplicationController
  
  def index
    @clothes = Clothe.all
  end
  
  def show
  end
  
end
