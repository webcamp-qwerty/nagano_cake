class Admin::OrdersController < ApplicationController

  def index
   @orders = Order.page(params[:order]).per(10)
  end

  def show
   @order = Order.find(params[:id])
   @items = @order.items
  end

  def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   @order_items = @order.order_items
    if @order.order_status == "confirming"
       @order_items.each do |item|
       item.update( make_status: "waiting" )
       end
    end
   redirect_to request.referer
  end


 private
 def order_params
  params.require(:order).permit(:order_status)
 end


end
