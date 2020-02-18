class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    find_booking
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:booking])

    if @booking.save
      redirect_to flats_path(@flat)
    else
      render :new
    end

    @booking.save
  end

  def edit
    find_booking
  end

  def update
    find_booking
    @booking.update(booking_params)
  end

  def destroy
    find_booking
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

end
