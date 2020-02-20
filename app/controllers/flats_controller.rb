class FlatsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:planet].present?
      render @flats = params[:planet].to_sym
    else
      @flats  = Flat.all
    end
  end

  def show
  end

  def new
    @flat =Flat.new
  end

  def create
    @flat =Flat.new(flat_params)
    @flat.photo.attach(io: params[:flat][:photo], filename: "photo.jpg", content_type: "image/jpg")
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
     @flat.destroy
     redirect_to flats_path
  end

  # def localisation
  #   case planet
  #   when planet: "mars"
  #     redirect_to localisation_path
  #   when planet: "moon"
  #     redirect_to localisation_path
  #   end
  # end


private

def set_flat
  @flat = Flat.find(params[:id])
end

def flat_params
  params.require(:flat).permit(:name, :planet, :capacity, :description, :price)
end

end
