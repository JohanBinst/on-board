class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @trip = Trip.find(params[:id])
    @booking = Booking.new
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


end
