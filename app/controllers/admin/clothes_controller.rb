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
    # byebug
    @clothe = Clothe.new(clothe_params)
    if @clothe.save
      redirect_to admin_clothe_path(@clothe.id)
    else
      render :new
    end
  end

  def edit
    @clothe = Clothe.find(params[:id])
  end

  def update
    @clothe = Clothe.find(params[:id])
    @clothe.update(clothe_params)
    redirect_to admin_clothe_path(@clothe.id)
  end

  private

    def clothe_params
      params.require(:clothe).permit(:image, :celsius, :introduction)
    end

end
