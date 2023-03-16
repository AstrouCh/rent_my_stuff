class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  # def show
  #   @items = Item.where(user_id: params[:id])
  # end

  def show
    @user = User.find(params[:id])
    @items = Item.where(user: params[:id])
    @bookings = Booking.where(user: current_user)
  end


end
