class MessagesController < ApplicationController
  # GET /bookings/:booking_id/messages
  def index
    @booking = Booking.find(params[:booking_id])
    @messages = @booking.messages
    @message = Message.new
  end

  # POST /bookings/:booking_id/messages
  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user
    if @message.save
      redirect_to booking_messages_path(@booking), status: :see_other
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
