class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :home
  def index
    @items = Item.all
  end

  def show
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entry
    end
  end

  def edit
  end

  def update
    @item = item.update(params[:item])
    if @item.update
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entry
    end
  end

  def destroy
    @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :location, :description)
  end


end
