class Admin::OrdersItemController < Admin::ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order = @order_item.order
    @order_items = @order.order_items
    if @order_item.make_status == "production"
       @order.update( order_status: "producing" )
    end
    @not_complete_flag = 1
    @order_items.each do |item|
      if item.make_status != "completed"
        @not_complete_flag += 1
      end
    end
    if @not_complete_flag == 1
      @order.update( order_status:"preparing" )

    end
    redirect_to request.referer
  end

  private
  def order_item_params
    params.require(:order_item).permit(:make_status)
  end
end
