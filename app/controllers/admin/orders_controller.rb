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
   redirect_to request.referer
  end


 private
 def order_params
  params.require(:order).permit(:order_status)
 end
 

end
