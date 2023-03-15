class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
  end

  def show
    @bookings = Booking.where(user_id: params[:id])
  end

end
