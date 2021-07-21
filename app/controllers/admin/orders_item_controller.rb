class Admin::OrdersItemController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order = @order_item.order
    @order_items = @order.order_items
    if @order_item.make_status == "production"
       @order.update( order_status: "producing" )
    end
    @make_status = @order.order_items.select("make_status")
    #@order_items.each do |item|
    if @make_status.all?{|make_status| make_status == "completed"}
      @order.update( order_status:"preparing" )
    end
    #end
    redirect_to request.referer
  end

  private
  def order_item_params
    params.require(:order_item).permit(:make_status)
  end
end
