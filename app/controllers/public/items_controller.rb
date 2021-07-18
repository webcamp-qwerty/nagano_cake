class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  def search
  @items = Item.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
  end

end
