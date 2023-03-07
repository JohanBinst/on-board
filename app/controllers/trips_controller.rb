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
end
