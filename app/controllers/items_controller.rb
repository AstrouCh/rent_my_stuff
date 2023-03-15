class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def index
    @items = Item.all
    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude
      }
    end
  end

  def show
    @booking = Booking.new
    @bookings = Booking.where(item: @item)
    @reviews = Review.where(booking: @bookings)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save!
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :location, :description, :category_id)
  end

end
