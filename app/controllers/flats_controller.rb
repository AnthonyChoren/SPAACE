class FlatsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats  = Flat.all
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
    if @flat.user_id == current_user.id
      @flat.destroy
      redirect_to flats_path
    else
      render :show
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :planet, :capacity, :description, :price)
  end

end
