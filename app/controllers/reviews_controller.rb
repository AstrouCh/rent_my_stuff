class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update destroy]

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    @item = Item.find(@review.booking.item.id)
    if @review.save!
      redirect_to item_path(@review.booking.item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to item_path(@review.booking.item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating) #:booking_id?
  end
end
