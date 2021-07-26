class Admin::ItemsController < Admin::ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all

  end

  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    @item.genre_id = params[:genre][:name]
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.genre_id = params[:genre][:name]
    item.update(item_params)
    redirect_to admin_item_path(item)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduct, :genre_id, :excluded_price, :is_active)
  end

end
