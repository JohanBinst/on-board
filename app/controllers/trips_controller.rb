class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
  end

  def edit
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
