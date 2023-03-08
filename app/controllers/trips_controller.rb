class TripsController < ApplicationController
  def index
    if params[:query].present? && params[:query].length > 0
      @trips = Trip.search_by_parameters(params[:query])
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text { render partial: "trips/row", locals: { trips: @trips }, formats: [:html] }
      end
    else
      @trips = Trip.all
    end
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

  private

  def trip_params
    params.required(:trip).permit(:name, :activity_type, :destination, :departure_point, :departure_date_time, :description, :features, :price, :seats)
  end

end
