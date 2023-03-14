class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new, status: :unprocessable_entry
    end
  end

  def edit
  end

  def update
    @review = review.update(params[:review])
    if @review.update
      redirect_to review_path(@review)
    else
      render :edit, status: :unprocessable_entry
    end
  end

  def destroy
    @review.destroy
  end

  private

  def set_review
    @item = Item.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating) #:booking_id?
  end
end
