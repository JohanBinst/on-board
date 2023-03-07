class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
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
  end

  private

  def trip_params
    params.required(:trip).permit(:name, :activity_type, :destination, :departure_point, :description, :features, :price, :seats)
  end
end
