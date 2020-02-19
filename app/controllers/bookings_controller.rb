class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    find_booking
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.flat = Flat.find(params[:flat_id])
    if @booking.save
      redirect_to flat_booking_path(flat_id:@booking.flat.id, id:@booking.id)
       # flat_booking GET    /flats/:flat_id/bookings/:id(.:format)
      #index reservation
    else
      render :new
    end
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
    redirect_to flats_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

end
