class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  def show
    @bookings = Bookings.where(user: current_user)
    @bookings_last = Booking.where(user: current_user).last
  end

  def new
    @item = Item.find(params[:item_id])
    @booking = Booking.new
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item = Item.find(params[:item_id])
    if @booking.save!
      redirect_to booking_path(@booking.user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking = booking.update(params[:booking])
    if @booking.update

      redirect_to booking_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_path, status: :see_other
  end


private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
