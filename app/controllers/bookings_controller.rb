class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :update, :accept, :reject]

  def index
    if current_user.yoga_studios.any?
      yoga_studio_ids = current_user.yoga_studios.pluck(:id)
      @bookings = Booking.where(yoga_studio_id: yoga_studio_ids)
    else
      @bookings = Booking.where(user: current_user)
    end
  end

  def show; end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.yoga_studio = YogaStudio.find(params[:yoga_studio_id])
    @booking.booking_status = "pending"
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to yoga_studio_path(@booking.yoga_studio)
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def accept
    @booking.update(booking_status: 'accepted')
    redirect_to bookings_path
  end

  def reject
    @booking.update(booking_status: 'rejected')
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:yoga_studio_id, :user_id, :checkin_date, :checkout_date, :booking_status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
