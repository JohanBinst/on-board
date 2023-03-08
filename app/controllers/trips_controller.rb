class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    @marker = { lat: -22.288932, lng: 166.441671 }
  end

  def create
    @trip = Trip.new(trip_params)
    #try this if current departure poits don't work with geocoder
    # @trip.departure_address = "#{@trip.departure_point}, Noumea"
    @trip.user_id = current_user.id
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @trip = Trip.find(params[:id])
    @booking = Booking.new
    # lat , long 166.441671
    @marker = Trip::DEPARTURE[@trip.departure_point.to_sym]
  end

  def my_trips
    # @user = current_user
    @trips = Trip.where(user_id: current_user.id)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to my_trips_path(current_user), status: :see_other
  end

  private

  def trip_params
    params.required(:trip).permit(:name, :activity_type, :destination, :departure_point, :departure_date_time, :description, :features, :price, :seats)
  end

end
