class Admin::OrdersController < ApplicationController

  def index
   @orders = Order.page(params[:order]).per(10)
  end
  
  def show
   @order = Order.find(params[:id])
   @items = @order.items
  end
  
  def orders_update
   @order = Order.find(params[:id])
   @order.update(order_params)
   redirect_to admin_order(order)
  end
  
  def items_update
   @order_item = OrderItem.find(params[:id])
   @order_item.update(order_item_params)
   redirect_to admin_order(prder)
  end
 
 private
 def order_params
  params.require(:order).permit(:order_status)
 end
 def order_item_params
  params.require(:order_item).permit(:make_status)
 end
  
end
