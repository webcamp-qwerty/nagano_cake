class Public::CartItemsController < ApplicationController

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if  @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      @customer = current_customer
      @cart_items = @customer.cart_items
      render :index
    end
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_items = current_customer.cart_items
    @cart_item.customer_id = current_customer.id
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_item_count = cart_item.item_count + @cart_item.item_count
        cart_item.update_attribute(:item_count, new_item_count)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :item_count)
  end

end
