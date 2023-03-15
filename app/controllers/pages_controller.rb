class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
  end

  def show
    @bookings = Booking.where(user_id: params[:id])
  end

  def show
    @bookings = Booking.where(user_id: params[:id])
  end

  def show_user
    @user = User.where(booking_id: params[:id])
  end
end
