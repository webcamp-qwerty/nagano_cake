class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

end
