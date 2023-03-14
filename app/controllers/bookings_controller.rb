class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  def show
    @user = User.where(user_id: params[:id])
  end

  def new
    @item = Item.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @item = Item.find(params[:list_id])
    @booking = Booking.new(booking_params)
    @booking.item = @item
    if @booking.save
      redirect_to booking_path(@booking)
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
  end

private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = booking.find(params[:id])
  end

end