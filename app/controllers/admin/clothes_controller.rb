class Admin::ClothesController < ApplicationController
  
  def new
    @clothe = Clothe.new
  end
  
  def index
    @clothes = Clothe.all
  end
  
  def show
    @clothe = Clothe.find(params[:id])
  end
  
  def create
    clothe = Clothe.new(clothe_params)
    clothe.save
    redirect_to admin_clothes_path
  end
  
  def edit
    @clothe = Clothe.find(params[:id])
  end
  
  def update
    
  end
  
  private
  
    def clothe_params
      params.require(:clothe).permit(:image, :celsius, :introduction)
    end
    
end
