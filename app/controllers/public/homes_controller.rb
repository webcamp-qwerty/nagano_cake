class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.where(is_active: true).page(params[:page]).per(4).reverse_order
  end

  def about
  end

end

