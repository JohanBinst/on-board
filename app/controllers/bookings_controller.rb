class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
    @trip = @booking.trip
  end

  def create
    if current_user.nil?
      redirect_to new_user_session_path, status: :see_other
    else
      @booking = Booking.new(booking_params)
      @trip = Trip.find(params[:trip_id])
      @booking.trip = @trip
      @booking.user = current_user
      @booking.total_price = @trip.price * @booking.total_guests
      if @booking.save
        redirect_to booking_path(@booking), status: :see_other
      else
        render 'trips/show', status: :unprocessable_entity
      end
    end
  end

  # def edit
  #   @booking = Booking.find(params[:id])
  # end

  # def update
  #   @booking.update(task_params)
  #   redirect_to booking_path(@path)
  # end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to users_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:total_guests, :total_price)
  end
end
